Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339231;
	b=c6nDimL3Oj3dbjMeP8IdU8eQmcSuzpLfjO8y16Qzu9QtCUviSAMbI2Cj63TO0w7l8cqb
	 NeLJVxWZrfDjbSR1itBAf2WwEfFHslW3gIhSL9tkNgGlXBIF00nTPamRorNCv3fjZCf4d
	 a1+C07m+jSx2mvUsRoT5VP9dsN2fPESFTGKXrPghXHCCozjCTqSfSAk/q0C9AY9lw7MAu
	 xF7doHK9f+EbypPptZyKLZMiuk8zMCB13q898JxgfH4s6qQoTXzJ0Ucy51E1QWaMTl8BQ
	 7+P4D7YOV74Q738Oxrdii+dIFUPdnXvwVmngoTh8IXOAyZT5E+Sqze70/t5AsIbgLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339231;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PwKnB8vusFC38NidYGeXP/OvxcdHiXBlFXmxsUk5hIU=;
	b=xFuEH3LfhzYlVdNnvQiCL+LmytAZHxDw22cSZ/JTlwXZ79RFmIEnJ+eFifWdeSmxAZAm
	 5DZSs+KSSnqR6JS9alufjECAyz8xKPqFb410j1CP9kTh2P7ZftBpKiHQaBRFSxH1TTSJw
	 fvEg8n1uGHhFEXojUgKB5FpXp6IuZ8mobErRZ/pvL3GOrUFGcOzOD6NXPXzCt4zCtyP4c
	 4pKMQHfor3Se3pRSzVi893OvVUtSerwsXvVvQrbMd7SapromboaHIH5qMzWs6SrIfWAC+
	 faSfuTu+diGtQcpR/csO60lnaG+ZnzB3xXWHsDJf4cbeGwZr5uXRHj5fqFlNiWMk3Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VsvbYdwq;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C4606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VsvbYdwq
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L2PQO1Eu8Zh0yQOhKwsxf82gavxb5aNtEP6JzcghrxY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795339227; v=1; x=1795944027;
 b=VsvbYdwqMl6RHdxshCYtsDW9cnuRG6M2BulTppJyRtjYyQTmJ9tzZ+eO1eqYIO/rwKLPeS30
 wA/tP6XA6NTJ3YJT3RFmXmnW1A00G8Ux4L6PmVJblnE/f6lduXOvXHI5fk+ziUDPtniQZh1b+Ns
 iPQscOgpciU6RfVMMChCs9lA=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dcd1cfd034329e6a;
	Sun, 22 Nov 2026 09:20:25 +0000
X-Mizu-Trace-ID: dcd1cfd034329e6a
X-Migadu-Flow: FLOW_OUT
Message-ID: <a527bf36-80d2-43d7-ab36-93f51e39fd02@linux.dev>
Date: Sun, 22 Nov 2026 10:19:49 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soundwire: protect the slave IRQ mapping during alert
 dispatch
To: Jizhou Tong <fqwqf@fqwqf.xyz>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 srini@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <010601a20218c3b5-523b454f-b8b0-4259-9b20-524c1d435465-000000@ap-northeast-1.amazonses.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <010601a20218c3b5-523b454f-b8b0-4259-9b20-524c1d435465-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 08:11, Jizhou Tong wrote:
> sdw_irq_create_mapping() publishes slave->irq before it registers the
> devres action. If devm_add_action_or_reset() fails, it disposes the
> mapping but leaves its number in slave->irq. sdw_bus_probe() then
> calls the peripheral driver's probe() with that stale number.

Maybe I am thick and didn't get the problem, but if any error occurred
in sdw_irq_create_mapping(), a simple way to prevent the driver probe
from happening would be to change the prototype and return an error
code, e.g.

	/* Create IRQ mapping now so the driver can get it in probe() */
	ret = sdw_irq_create_mapping(slave);
	if (!ret)
		return ret;

	ret = drv->probe(slave, id);

> Clearing the number on release alone also leaves a window for the alert
> handler to pick up the old IRQ before its mapping is disposed. Keep the
> mapping private until cleanup is registered. On teardown, take a
> per-slave write lock to drain active dispatches and clear the number
> before disposing the mapping. Hold the read side across the nested IRQ
> handler, which runs in thread context and can sleep.

not following either. Presumably on a release, the interrupts are masked
in the codec driver prior to cleanups at the bus level. In what case
would an interrupt handler start *after* the resources are released?

And last the 'irq_lock' is confusing, existing ASoC/SoundWire codec
drivers already use a 'disable_irq_lock' - stored as a private resource
to avoid polluting the sdw_slave struct.

> The lock is independent of sdw_dev_lock so nested handlers continue to
> run outside the peripheral callback lock. Peripherals that can operate
> without an IRQ can still probe if mapping setup fails. Return early on
> a zero mapping so there is no cleanup action to register for IRQ 0.
> 
> Fixes: a5fef9baa87f ("soundwire: bus: Move irq mapping cleanup into devres")
> Link: https://lore.kernel.org/r/d7761226-31b0-4d0f-bc56-9c4d5e42bfba@opensource.cirrus.com
> Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
> ---
> This came up while moving WCD938x to SoundWire domain IRQs. Richard
> previously pointed out the stale IRQ on release.
> 
> The rwsem lets overlapping alerts run and keeps per-slave state small.
> Reusing sdw_dev_lock would bring it into nested handlers. A per-slave
> SRCU domain would also have to drain readers during teardown. On this
> base, mapping setup precedes the peripheral probe and sdw_dev_lock.
> Unbind still holds the device mutex while draining readers. Do any
> domain IRQ handlers depend on work that needs that same device mutex?
> 
> Built soundwire-bus.o with ARCH=arm64 W=1. In a four-vCPU arm64 guest
> with PROVE_LOCKING and DEBUG_ATOMIC_SLEEP enabled, an emulated peripheral
> ran three rounds of 200 driver-core bind/unbind cycles under concurrent
> alert dispatch. Removal started with an active handler in 514 of the 600
> cycles. To exercise lock ordering against sdw_dev_lock, the test handler
> acquired that lock and slept while holding it. Lockdep remained enabled
> and reported no warnings in any run.
> The physical codec and runtime PM paths still need coverage.
> 
>  drivers/soundwire/bus.c       |  4 ++--
>  drivers/soundwire/irq.c       | 36 +++++++++++++++++++++++++++++++----
>  drivers/soundwire/irq.h       |  5 +++++
>  drivers/soundwire/slave.c     |  1 +
>  include/linux/soundwire/sdw.h |  3 +++
>  5 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index aeaae5a57c89d8af05cadd6fe55d44856600e781..0bc0ad9e9934e790c27526ff4c736e8d5a2bebaf 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1781,8 +1781,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  
>  		/* Update the Slave driver */
>  		if (slave_notify) {
> -			if (slave->prop.use_domain_irq && slave->irq)
> -				handle_nested_irq(slave->irq);
> +			if (slave->prop.use_domain_irq)
> +				sdw_irq_handle(slave);
>  
>  			mutex_lock(&slave->sdw_dev_lock);
>  
> diff --git a/drivers/soundwire/irq.c b/drivers/soundwire/irq.c
> index f18be37efef8e0ef63bad159cc0d9ebb619a89bf..1f13e1093d94863012fb966b555682826f051cb6 100644
> --- a/drivers/soundwire/irq.c
> +++ b/drivers/soundwire/irq.c
> @@ -2,10 +2,13 @@
>  // Copyright (C) 2023 Cirrus Logic, Inc. and
>  //                    Cirrus Logic International Semiconductor Ltd.
>  
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/fwnode.h>
> +#include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/rwsem.h>
>  #include <linux/soundwire/sdw.h>
>  #include "irq.h"
>  
> @@ -49,15 +52,40 @@ void sdw_irq_delete(struct sdw_bus *bus)
>  static void sdw_irq_dispose_mapping(void *data)
>  {
>  	struct sdw_slave *slave = data;
> +	unsigned int irq;
>  
> -	irq_dispose_mapping(slave->irq);
> +	scoped_guard(rwsem_write, &slave->irq_lock) {
> +		irq = slave->irq;
> +		slave->irq = 0;
> +	}
> +
> +	irq_dispose_mapping(irq);
>  }
>  
>  void sdw_irq_create_mapping(struct sdw_slave *slave)
>  {
> -	slave->irq = irq_create_mapping(slave->bus->domain, slave->index);
> -	if (!slave->irq)
> +	unsigned int irq;
> +
> +	irq = irq_create_mapping(slave->bus->domain, slave->index);
> +	if (!irq) {
>  		dev_warn(&slave->dev, "Failed to map IRQ\n");
> +		return;
> +	}
> +
> +	if (devm_add_action(&slave->dev, sdw_irq_dispose_mapping, slave)) {
> +		irq_dispose_mapping(irq);
> +		dev_warn(&slave->dev, "Failed to register IRQ mapping cleanup\n");
> +		return;
> +	}
> +
> +	guard(rwsem_write)(&slave->irq_lock);
> +	slave->irq = irq;
> +}
> +
> +void sdw_irq_handle(struct sdw_slave *slave)
> +{
> +	guard(rwsem_read)(&slave->irq_lock);
>  
> -	devm_add_action_or_reset(&slave->dev, sdw_irq_dispose_mapping, slave);
> +	if (slave->irq)
> +		handle_nested_irq(slave->irq);
>  }
> diff --git a/drivers/soundwire/irq.h b/drivers/soundwire/irq.h
> index 86e2318409dab8b8137df45586029a6312ee61ff..93e949ec10ca37abea6f0fb8f88e4f016e83259a 100644
> --- a/drivers/soundwire/irq.h
> +++ b/drivers/soundwire/irq.h
> @@ -16,6 +16,7 @@ int sdw_irq_create(struct sdw_bus *bus,
>  		   struct fwnode_handle *fwnode);
>  void sdw_irq_delete(struct sdw_bus *bus);
>  void sdw_irq_create_mapping(struct sdw_slave *slave);
> +void sdw_irq_handle(struct sdw_slave *slave);
>  
>  #else /* CONFIG_IRQ_DOMAIN */
>  
> @@ -33,6 +34,10 @@ static inline void sdw_irq_create_mapping(struct sdw_slave *slave)
>  {
>  }
>  
> +static inline void sdw_irq_handle(struct sdw_slave *slave)
> +{
> +}
> +
>  #endif /* CONFIG_IRQ_DOMAIN */
>  
>  #endif /* __SDW_IRQ_H */
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index a7d2938b031d0f2d32986e93ffb2bd85e7d73520..ffe21bb04ff70e71af681b26cc475ea65c188c68 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -65,6 +65,7 @@ int sdw_slave_add(struct sdw_bus *bus,
>  	slave->probed = false;
>  	slave->first_interrupt_done = false;
>  	mutex_init(&slave->sdw_dev_lock);
> +	init_rwsem(&slave->irq_lock);
>  
>  	for (i = 0; i < SDW_MAX_PORTS; i++)
>  		init_completion(&slave->port_ready[i]);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index f710e5932b4b23c025579b3c8346fe4b5e5f2624..d8c8eae7aed67ae02a140656432a561b28876575 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -15,6 +15,7 @@
>  #include <linux/lockdep_types.h>
>  #include <linux/device-id/sdw.h>
>  #include <linux/mutex.h>
> +#include <linux/rwsem.h>
>  #include <linux/types.h>
>  #include <sound/sdca.h>
>  
> @@ -643,6 +644,7 @@ struct sdw_slave_ops {
>   * @id: MIPI device ID
>   * @dev: Linux device
>   * @index: internal ID for this slave
> + * @irq_lock: protects the IRQ mapping during nested interrupt handling
>   * @irq: IRQ number
>   * @status: Status reported by the Slave
>   * @bus: Bus handle
> @@ -676,6 +678,7 @@ struct sdw_slave {
>  	struct sdw_slave_id id;
>  	struct device dev;
>  	int index;
> +	struct rw_semaphore irq_lock;
>  	int irq;
>  	enum sdw_slave_status status;
>  	struct sdw_bus *bus;
> 
> base-commit: afd88e7ad78170040612f608203734156b8a9eb1
> 

