using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Equinox.Domain.Events
{
	public class CustomerEventHandler :
		INotificationHandler<CustomerRegisteredEvent>,
		INotificationHandler<CustomerUpdatedEvent>,
		INotificationHandler<CustomerRemovedEvent>
	{
		public Task Handle(CustomerUpdatedEvent message, CancellationToken cancellationToken)
		{
			return Task.CompletedTask;
		}

		public Task Handle(CustomerRegisteredEvent message, CancellationToken cancellationToken)
		{
			return Task.CompletedTask;
		}

		public Task Handle(CustomerRemovedEvent message, CancellationToken cancellationToken)
		{
			return Task.CompletedTask;
		}
	}
}