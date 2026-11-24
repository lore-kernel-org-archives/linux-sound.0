Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537746;
	b=yxzjFLnGB/42hDTW004iYTMgGyy3uqoFib9bB0cJ4EJHd33DMa7z2gKw0oQoBjhJxcq9
	 HxlGqWSwTSCgT1LG/KDJxdaJhoTx0kHp96vGKOdU/IVxX4sKLehDxo6OBL9GTEvtIzb7W
	 llHNhkRF7io3XmYo/Fuf74VVr5cMhvmgH5YDfXmP22fghfmnR9vM4MYpS2CskTJ58HCor
	 o7pEjgj3SZBofZUKKL6dRZAyIsgHfcEOhfdO/mWy3x5aNaOxKJ2P5wBgsOmgKI0MCMze5
	 fO9iW1mqj7P4sc/dzeSCzR0Gm+Pr5afHNdKko623o6qzhyYPG8ONYPb0xsGXhIviJGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537746;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/CfYIuZ8JRe35BvDN+ru76eqhGH7924IUXu/F/Q8ajU=;
	b=1zzwIYkw6ns/Spn8D8YSUuKWEHn5xnDxYU25uPvpW6eP4CxSt4VNj82JWsJyBtMLHyIr
	 +5axxQH8RCxh1NfTOA8QGnB6p0SZ+mMXl0QT0NcMeCr/zds+qkMp3yqQ3omn5I0544YZ1
	 5x08DIDM9wMBZ8LH0GagmTjfZDw3emerTu6p3E7YH8fxSqk3CdcoMXz+Ld0mRzaEvYnS2
	 j3ZxvlrIvoQVLa8H6F5yQstdC59zs/UjtlP6C6JMDsEb7EPdUFtZm/dZQ4/nizZYOxP9c
	 EAo3rSJYaZ8l3GNmlXGF4FAYtB3uZmqCYLhbLfFgX3/Sf6MeonUbPwfN96nPYOWckPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leBeenZq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F5606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leBeenZq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368301F000D1;
	Tue, 24 Nov 2026 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537746;
	bh=/CfYIuZ8JRe35BvDN+ru76eqhGH7924IUXu/F/Q8ajU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=leBeenZq9C8D3+IeN0RIESJs+8eTYLrNjfWP83s/qj705ZB2aFHwFGX7Ec6z/LVTC
	 AUlW9dbnLnhEL84rilA+eeP3fOMEWPMMMcZ1DHGZiqunXo4FzNAOjK+8WQsIcJR15H
	 KLUs0VoaEFeX5h7jD/GaSMswnAdfYdXobl96RSsy+KuAmJM/iiYC4E4BbUGvqSu2E/
	 6bKJ1Jc85Q+/6e/+V17MCxMWk8Loer/K6/JtCbdeL3cDnfYENNsVgcLbbulRrPqXRB
	 2YD8fvCnzm1Zj2SOf2WsXzfg2DHr1okJ+KbFk5rvyx0My2U14JG5p15QhLnoHjaijE
	 lE5CplA8x7jvw==
Message-ID: <sashiko-outbox-231567@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] soundwire: bus: Expose a helper to remove
 devices from the bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124161001.702882-4-ckeepax@opensource.cirrus.com>
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:29:05 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] soundwire: bus: UAF and disposed IRQ access after
  sdw_bus_slaves_delete()
- [Medium] soundwire: bus: unlocked list traversal in
  sdw_bus_slaves_put()
--

commit 5d1d7079438eb055e1748b6f548e146aa51c7a6c
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

soundwire: bus: Expose a helper to remove devices from the bus

This commit splits peripheral device removal out of sdw_bus_master_delete()
into a new exported sdw_bus_slaves_delete() helper while deferring slave
list removal, device number release, and put_device() to a new
sdw_bus_slaves_put() helper.

> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index eddff9a5fd35d..c97f6c27fa854 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -169,7 +169,6 @@ EXPORT_SYMBOL(sdw_bus_master_add);
>  static int sdw_delete_slave(struct device *dev, void *data)
>  {
>  	struct sdw_slave *slave =3D dev_to_sdw_dev(dev);
> -	struct sdw_bus *bus =3D slave->bus;
> =20
>  	pm_runtime_disable(dev);
> =20
> @@ -186,18 +185,38 @@ static int sdw_delete_slave(struct device *dev, voi=
d *data)
>  	 */
>  	device_del(dev);
> =20
> -	mutex_lock(&bus->bus_lock);
> -	if (slave->dev_num) { /* clear dev_num if assigned */
> -		clear_bit(slave->dev_num, bus->assigned);
> -		if (bus->ops && bus->ops->put_device_num)
> -			bus->ops->put_device_num(bus, slave);
> -	}
> -	list_del_init(&slave->node);
> -	mutex_unlock(&bus->bus_lock);
> +	return 0;
> +}
> =20
> -	put_device(dev);
> +/**
> + * sdw_bus_slaves_delete() - delete all peripherals on a bus
> + * @bus: bus with peripherals to be deleted
> + *
> + * Delete the child devices.
> + */
> +void sdw_bus_slaves_delete(struct sdw_bus *bus)
> +{
> +	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
> +}
> +EXPORT_SYMBOL(sdw_bus_slaves_delete);

[Severity: High]
Can deferring the bus->assigned and bus->slaves cleanup until
sdw_bus_slaves_put() cause a NULL pointer dereference or use-after-free
when a status update arrives after sdw_delete_slave()?

device_del(dev) runs devres_release_all(&slave->dev), which invokes
sdw_irq_dispose_mapping() to free slave->irq's descriptor (leaving
slave->irq non-zero) and frees devm-allocated slave->prop.dp0_prop.
Because the slave remains in bus->slaves and bus->assigned until the
controller later calls sdw_bus_master_delete(), a concurrent status
update can still reach the deleted slave:

CPU0                                    CPU1 (status workqueue)
sdw_bus_slaves_delete(bus)
  sdw_delete_slave(&slave->dev)
    device_del(&slave->dev)
      devres_release_all(&slave->dev)
        irq_dispose_mapping(slave->irq)
                                        sdw_handle_slave_status(bus, ...)
                                          sdw_handle_slave_alerts(slave)
                                            handle_nested_irq(slave->irq)
                                              <-- NULL irq_desc dereference

Similarly, if a peripheral re-attaches during teardown,
sdw_initialize_slave() runs without checking slave->probed and
dereferences the freed slave->prop.dp0_prop.

> -	return 0;
> +static void sdw_bus_slaves_put(struct sdw_bus *bus)
> +{
> +	struct sdw_slave *slave, *tmp;
> +
> +	list_for_each_entry_safe(slave, tmp, &bus->slaves, node) {
> +		mutex_lock(&bus->bus_lock);
> +		if (slave->dev_num) { /* clear dev_num if assigned */
> +			clear_bit(slave->dev_num, bus->assigned);
> +			if (bus->ops && bus->ops->put_device_num)
> +				bus->ops->put_device_num(bus, slave);
> +		}
> +		list_del_init(&slave->node);
> +		mutex_unlock(&bus->bus_lock);
> +
> +		/* See comment in sdw_delete_slave() */
> +		put_device(&slave->dev);
> +	}
>  }

[Severity: Medium]
Is it safe for list_for_each_entry_safe() to traverse bus->slaves
without holding bus->bus_lock across the iteration?

On controllers whose interrupt handler remains active during
sdw_bus_master_delete() (such as qcom_swrm_remove(), where the IRQ is
managed with devm), a concurrent enumeration interrupt can call
sdw_slave_add(), which modifies bus->slaves under bus->bus_lock via
list_add_tail() and list_del().  Reading the list pointers outside
bus->bus_lock can race with those updates and miss a newly added slave
or follow a removed node.  Holding bus->bus_lock around a
while (!list_empty(&bus->slaves)) loop and dropping it only around
put_device(&slave->dev) would avoid the unlocked traversal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124161001.7028=
82-1-ckeepax@opensource.cirrus.com?part=3D3
