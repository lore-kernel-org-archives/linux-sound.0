Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537622;
	b=EIr6qUdNiIKfD1i6ozePwaBQ/lM6g8WnOCwBa3ZIRlJmx9WLnkMNr6umxBxmttOpkPsc
	 mddpMsAo6lylWQS3KsOXRR9nouNARUYdvHv+ZT+0tb+6MjDA4DMbs04KiKpbewLIjEQq4
	 ra19sBC5UgdkadATshaIxiyWH3E2P9vmnYOKk/TN37/MDiFP+LYqKp9Jj8DxnobShEeQG
	 5Arhk2Z0PfUrK6rcwm6dqoLJILuzszsykHpBSBtATEgMLdblgvhoQUHKBMLH5VE5oT4Rl
	 YPqxLgwIZoJy13Zd+Z5VOYYqufIv6/6KUsW3yzf3vW3uy/IHICXRyf7ZqlcD1JsOrSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537622;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QKNG9vUd7ovY4G/XfErHoiuDboqJqrAlCsCfOreBVX4=;
	b=OszIZRAPDySIvb0cOwO+6AerfpcxZfL74VvtXtW7ZNmYBehU7zHjsxxU45A1fCm5CPmF
	 M0CAtBZtv1u+uilRelqqz6T4S0k62oz5vKxpv+CDQPqbROhz3aAmjiO+ovm7das/l6H0W
	 lGksgYnbkK2fXIkU3pEJtu5lTuKVksWjAoY3uJ+athDZbaAEDZk8vPhAMYRFzDVtraHMy
	 XOAfzt0mnv7XQosGg7tke1WK0WKL6EQuQOdr5H2oqu1bOAeUh+fypgOxmKEpA7Ev05ZYp
	 G3SoNMU7kxgAR7sPv51z1W0PsEI3i5lTMkLqEE8ZHNytB3xfJtPhBsROy3/uPSjAiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YkymPXPC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492C606A323
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YkymPXPC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EEC1F000CF;
	Tue, 24 Nov 2026 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537621;
	bh=QKNG9vUd7ovY4G/XfErHoiuDboqJqrAlCsCfOreBVX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YkymPXPCglwyY4lTQ0HYvFNvR8Hlu7L9N2Zx0PNNADa+YzjGNHGqGgJs/JB2mqTD8
	 WeXE9gSgsT88UWZ95DCyFHoOENRvc2P8ehEgrCYOZQ2DBC1+u3n8uuYlXt0zy4sjt1
	 Ay013rD/LY+yWCExGlEXZGEbw1XtCe4gXo3AMepvfz8QbLO7RLlQsH+Waf3lQD4uhC
	 cYBgCIgWLTvna17jGjUfHArKaSN6eQTxbgt7jo3ijlclDGHkVAYv1T0q7ZTPbApNlz
	 m9H9fIEcdiCmFZmQppTW7UKMMzFiQ+bveirN+bd+AZmXAJgtZdgdjBmgyyDT/eUcvO
	 t92RQbfhsq16A==
Message-ID: <sashiko-outbox-231558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124161001.702882-5-ckeepax@opensource.cirrus.com>
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:27:00 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] soundwire: free_irq() called before disabling IRQs in
  intel_link_remove()
- [Medium] soundwire: cdns->work races with devres release in
  sdw_bus_slaves_delete()
- [Medium] soundwire: missing free_irq() on error path in
  intel_link_probe()
--

commit 7c3721ba123431be83148cab636e34ed615878ea
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

soundwire: intel_auxdevice: Don't disable IRQs before removing children

This commit defers freeing the link IRQ and disabling Cadence interrupts
in intel_link_remove() until after sdw_bus_slaves_delete() has removed the
child slave devices.

> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/inte=
l_auxdevice.c
> index d84fbe716febc..450c3927f0910 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -511,8 +511,6 @@ static void intel_link_remove(struct auxiliary_device=
 *auxdev)
>  	struct sdw_intel *sdw =3D cdns_to_intel(cdns);
>  	struct sdw_bus *bus =3D &cdns->bus;
> =20
> -	free_irq(sdw->link_res->irq, cdns);
> -
>  	/*
>  	 * Since pm_runtime is already disabled, we don't decrease
>  	 * the refcount when the clock_stop_quirk is
> @@ -521,8 +519,15 @@ static void intel_link_remove(struct auxiliary_devic=
e *auxdev)
>  	if (!bus->prop.hw_disabled) {
>  		sdw_intel_debugfs_exit(sdw);
>  		cancel_delayed_work_sync(&cdns->attach_dwork);
> -		sdw_cdns_enable_interrupt(cdns, false);
>  	}
> +
> +	sdw_bus_slaves_delete(bus);

[Severity: Medium]
Can cdns_update_slave_status_work() race with sdw_bus_slaves_delete() and
access resources already released by device_del()?

Because commit "soundwire: bus: Don't unassign dev_num before
unregistering device" leaves slave->dev_num set in bus->assigned and the
slave on bus->slaves until sdw_bus_master_delete() calls
sdw_bus_slaves_put(), a concurrent status update work item still looks up
the slave after device_del() has released its devres allocations:

CPU0                                  CPU1 (kworker)
intel_link_remove()
  sdw_bus_slaves_delete(bus)
    sdw_delete_slave()
      device_del(&slave->dev)
        ...
          devres_release_all()
            sdw_irq_dispose_mapping()
              irq_dispose_mapping(slave->irq)
            /* frees prop->dp0_prop */
                                      cdns_update_slave_status_work()
                                        sdw_handle_slave_status()
                                          sdw_handle_slave_alerts()
                                            handle_nested_irq(slave->irq)
                                              <-- NULL deref / use-after-fr=
ee

In sdw_handle_slave_alerts(), handle_nested_irq(slave->irq) runs outside
slave->sdw_dev_lock without checking slave->probed after slave->irq has
been disposed.  Similarly, if the slave transitions to SDW_SLAVE_ATTACHED,
sdw_initialize_slave() dereferences the devm-freed slave->prop.dp0_prop.

> +
> +	free_irq(sdw->link_res->irq, cdns);
> +
> +	if (!bus->prop.hw_disabled)
> +		sdw_cdns_enable_interrupt(cdns, false);

[Severity: Medium]
Should sdw_cdns_enable_interrupt(cdns, false) be called before free_irq()?

sdw_cdns_enable_interrupt(cdns, false) sets cdns->interrupt_enabled to
false, calls cancel_work_sync(&cdns->work), and then clears
CDNS_MCP_INTMASK.  When free_irq() runs first, any in-flight
cdns_update_slave_status_work() waiting in _cdns_xfer_msg() on
cdns->tx_complete has no sdw_cdns_irq() handler registered to service
CDNS_MCP_INT_RX_WL, so each bus transfer blocks for CDNS_TX_TIMEOUT
(500 ms).  In addition, while CDNS_MCP_INTMASK remains enabled after
free_irq(), any asserted Cadence interrupt has no handler on
sdw->link_res->irq to clear CDNS_MCP_INTSTAT.

[Severity: Medium]
In intel_link_probe(), added by commit "ASoC: SOF: Intel: Add IRQ chip to
distribute the SoundWire IRQ", does a failure in sdw_bus_master_add() leak
sdw->link_res->irq and leave cdns registered as the IRQ dev_id after devres
frees sdw?

drivers/soundwire/intel_auxdevice.c:intel_link_probe() {
	...
	ret =3D request_threaded_irq(sdw->link_res->irq, NULL, sdw_cdns_irq,
				   IRQF_SHARED | IRQF_ONESHOT, dev_name(dev),
				   cdns);
	if (ret) {
		dev_err(dev, "failed to request IRQ: %d\n", ret);
		return ret;
	}

	ret =3D sdw_bus_master_add(bus, dev, dev->fwnode);
	if (ret) {
		dev_err(dev, "sdw_bus_master_add fail: %d\n", ret);
		return ret;
	}
	...
}

Because sdw is allocated with devm_kzalloc_obj(dev, *sdw) while
request_threaded_irq() is non-managed, returning without calling
free_irq(sdw->link_res->irq, cdns) leaves sdw_cdns_irq() active on the
shared interrupt line with a freed dev_id pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124161001.7028=
82-1-ckeepax@opensource.cirrus.com?part=3D4
