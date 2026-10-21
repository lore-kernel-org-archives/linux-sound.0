Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626163;
	b=OnTyOlD/T2et8pO5/qkNo4K17OOZTZPojpnlQNp+snWccWaWeZMnPJk/GNJQ3btGo+Mr
	 P/1omnmKxmfu5Dg+S87O5NhNBUYR9vsLpvS8Bs2mJDPwePdKnqOwSHGEcn6nsOzEqb+uy
	 yI4KEWHoywsYA7qjkvr9xuEB3kmlpLHjaENm/ak0k7q0GqL62zwD9DdwVNxseO3qMC1qi
	 IS6BWN64Rsjn/H+JqI7oxYmpvUDxYtV7+V8Ry3EC3heKxFmtUKhHQz+T3y95JbGSC93K2
	 52ns0Ewi0lL9o3Kr7olnmFe/3y7l7cHdVtoj9vFqYXwV0LunXTQBDSm8CsjmF0wU8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VYhF9BrjdX19MprUaM/ozuZwxyfWSVe3ky/qpLR84gg=;
	b=FbT4DSfDZObNE/ng8Mf5de1qzFcJ7AQGn1Te5iSvknRpSZWiDisyVal5d2jPd85jxKD5
	 PgmcH7eOLrMceZ2PihFbBh6wKyDmG1RO5PZ9AOHmyQEle1HobtcGLmDvyJqweBNDM1rJQ
	 JCVfAez6KlZU7xQlLUJtElrHpn2M0km5hwoeYrZ1xgvsptKECaZsPSMejt+Z9dEQi4kJk
	 1MCV08QMtrwnLzk2pkeTgz5foZUms6VIYAc2pV79EJCrFo1vjWEQse2eKQbtKagJLOupq
	 K6n+N4d9NxZHrAWye8YSmSQuZJsEwJ+dVDl6j4jsocTmA1AqCzekH1cAxWFnSYTCl7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rz1PGphh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EB606A31F
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rz1PGphh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717EC1F000C5;
	Wed, 21 Oct 2026 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626162;
	bh=VYhF9BrjdX19MprUaM/ozuZwxyfWSVe3ky/qpLR84gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rz1PGphh0ZTn9pTJg674D5cCZKrqO53JrklVor0RktoeNlYKaVSHgygHm2x8qM0rW
	 kfLeJ4ixeavM2oTZ9a+SHTSRhhVkIKLfCSve7HYIe7WsdYi3PZBqEzQlsnvU8ZZmXa
	 zx7h1/YLydQScb04eMKUS07/iVQI1R7RnUzYHYFGUrxnYM4XjEP4kVVxFqWjdoMhMz
	 lOG2e6LyhgCJOQEdoNnbY9+b1TIrXqjjNh6TzbVONUX3xAYBhMk3p1Cx/x3xFjto6y
	 VLwp0auygC4is3FN7wgN2I/aLOJ2fb4bvzVl/5zfVG1f3zkQPEzEt6WD/Ynqo/OU75
	 eWNnC/icpbgAA==
Message-ID: <sashiko-outbox-180786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Reset Blue Yeti firmware 0.20 after
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: jasmeet.bhatia.us@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261021231754.16928-1-jasmeet.bhatia.us@gmail.com>
References: <20261021231754.16928-1-jasmeet.bhatia.us@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 23:42:41 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ALSA: usb-audio: module text UAF via module_put() in snd_usb_yeti_=
reset_work()
- [Medium] ALSA: usb-audio: Blue Yeti resume quirk skipped or fails under r=
untime PM
- [Medium] ALSA: usb-audio: untracked work in snd_usb_yeti_resume_quirk() c=
auses duplicate resets and post-disconnect I/O
--

commit 592f2406e0255360e88f55c391bf3d248002c71a
Author: Jasmeet (Jazz) Bhatia <jasmeet.bhatia.us@gmail.com>

ALSA: usb-audio: Reset Blue Yeti firmware 0.20 after resume

This commit adds a resume quirk for Blue Yeti Classic microphones with
firmware 0.20 (USB ID 046d:0ab7, bcdDevice 0x0020) that schedules a deferred
volatile ROM reset command on system_freezable_wq after system resume so the
device re-enumerates and restores audio capture.

> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 9307da95efbef..ebacb98fc34e4 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -1280,6 +1280,9 @@ static int usb_audio_resume(struct usb_interface *i=
ntf)
>  	if (chip->num_suspended_intf > 1)
>  		goto out;
> =20
> +	if (chip->system_suspend)
> +		snd_usb_apply_resume_quirk(chip);

[Severity: Medium]
Can gating snd_usb_apply_resume_quirk() on chip->system_suspend in
sound/usb/card.c:usb_audio_resume() cause the reset quirk to be skipped when
the device is runtime-suspended prior to system suspend?

Because usb_audio_driver enables .supports_autosuspend =3D 1 and 046d:0ab7 =
does
not set QUIRK_FLAG_DISABLE_AUTOSUSPEND, a runtime suspend before system sle=
ep
calls usb_audio_suspend(intf, PMSG_AUTO_SUSPEND), which leaves
chip->system_suspend as 0:

sound/usb/card.c:usb_audio_suspend() {
    ...
	if (!PMSG_IS_AUTO(message) && !chip->system_suspend) {
		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D3hot);
		chip->system_suspend =3D chip->num_suspended_intf;
	}
    ...
}

When the system subsequently enters system suspend (PMSG_SUSPEND),
drivers/usb/core/driver.c:usb_suspend_both() sees that udev->state is alrea=
dy
USB_STATE_SUSPENDED and skips calling usb_suspend_interface() ->
usb_audio_suspend():

drivers/usb/core/driver.c:usb_suspend_both() {
	if (udev->state =3D=3D USB_STATE_NOTATTACHED ||
			udev->state =3D=3D USB_STATE_SUSPENDED)
		goto done;
    ...
}

On system resume, usb_resume_both(udev, PMSG_RESUME) calls usb_audio_resume=
()
with chip->system_suspend still equal to 0, so snd_usb_apply_resume_quirk()
will not run.

Also, when snd_usb_yeti_resume_quirk() queues yeti->work onto
system_freezable_wq, it only takes a kobject reference via usb_get_dev(dev)
without holding a runtime PM reference (such as usb_autopm_get_interface() =
or
usb_autoresume_device()). Since system_freezable_wq remains frozen until
thaw_workqueues() runs after dpm_resume_end(), could the device autosuspend
before snd_usb_yeti_reset_work() executes, causing usb_control_msg_send() to
fail with -EHOSTUNREACH?

> +
>  	list_for_each_entry(as, &chip->pcm_list, list) {
>  		err =3D snd_usb_pcm_resume(as);
>  		if (err < 0) {
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index a54fabce7920d..42d955c7b7a4d 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c

[ ... ]

> @@ -1626,6 +1628,81 @@ int snd_usb_apply_interface_quirk(struct snd_usb_a=
udio *chip,
>  	return 0;
>  }
> =20
> +/*
> + * Blue Yeti Classic firmware 0.20 may stop delivering capture samples
> + * after a system suspend/resume while otherwise remaining enumerated.
> + *
> + * Sending the device's volatile ROM reset command restarts its MCU and
> + * USB logic, causing it to re-enumerate and restoring capture.
> + *
> + * Do not send the command directly from the USB resume callback because
> + * it deliberately disconnects the device.  Queue it on the freezable
> + * workqueue so it runs after device resume callbacks have completed.
> + */
> +struct snd_usb_yeti_reset {
> +	struct work_struct work;
> +	struct usb_device *dev;
> +};
> +
> +static void snd_usb_yeti_reset_work(struct work_struct *work)
> +{
> +	struct snd_usb_yeti_reset *yeti =3D
> +		container_of(work, struct snd_usb_yeti_reset, work);
> +	struct usb_device *dev =3D yeti->dev;
> +	static const u8 reset_cmd[8] =3D {
> +		0x00, 0x09, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00
> +	};
> +	int err;
> +
> +	err =3D usb_control_msg_send(dev, 0, UAC_SET_CUR,
> +				   USB_DIR_OUT | USB_TYPE_CLASS |
> +				   USB_RECIP_INTERFACE,
> +				   0x0a00, 0x1900,
> +				   reset_cmd, sizeof(reset_cmd),
> +				   USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
> +
> +	if (err && err !=3D -ENODEV)
> +		dev_warn(&dev->dev,
> +			 "Blue Yeti resume reset failed: %d\n", err);
> +
> +	usb_put_dev(dev);
> +	kfree(yeti);
> +	module_put(THIS_MODULE);
> +}

[Severity: High]
Does calling module_put(THIS_MODULE) at the end of
sound/usb/quirks.c:snd_usb_yeti_reset_work() leave a race window where the
module text can be unmapped before the worker thread returns from the
function?

Because yeti->work is allocated as an untracked object and is not flushed v=
ia
cancel_work_sync() in usb_audio_disconnect() or on module exit,
snd_usb_yeti_reset_work() relies on __module_get(THIS_MODULE) to keep
snd-usb-audio loaded while the work runs.

When the reset command disconnects the USB device (or if the device was
already unbound), module_put(THIS_MODULE) can drop the last reference to the
module while execution is still inside snd_usb_yeti_reset_work(). Once the
refcount reaches zero, a concurrent delete_module() in
kernel/module/main.c:delete_module() can proceed:

kernel/module/main.c:delete_module() {
	ret =3D try_stop_module(mod, flags, &forced);
	if (ret !=3D 0)
		goto out;

	mutex_unlock(&module_mutex);
	/* Final destruction now no one is using it. */
	if (mod->exit !=3D NULL)
		mod->exit();
    ...
	free_module(mod);
}

This can unmap the module's executable text before the worker thread finish=
es
returning from module_put() and executing the epilogue of
snd_usb_yeti_reset_work().

> +
> +static void snd_usb_yeti_resume_quirk(struct snd_usb_audio *chip)
> +{
> +	struct usb_device *dev =3D chip->dev;
> +	struct snd_usb_yeti_reset *yeti;
> +
> +	if (chip->usb_id !=3D USB_ID(0x046d, 0x0ab7) ||
> +	    le16_to_cpu(dev->descriptor.bcdDevice) !=3D 0x0020)
> +		return;
> +
> +	yeti =3D kmalloc_obj(*yeti);
> +	if (!yeti) {
> +		dev_warn(&dev->dev,
> +			 "Blue Yeti resume reset allocation failed\n");
> +		return;
> +	}
> +
> +	INIT_WORK(&yeti->work, snd_usb_yeti_reset_work);
> +	yeti->dev =3D usb_get_dev(dev);
> +	__module_get(THIS_MODULE);
> +
> +	if (!queue_work(system_freezable_wq, &yeti->work)) {
> +		module_put(THIS_MODULE);
> +		usb_put_dev(yeti->dev);
> +		kfree(yeti);
> +	}
> +}

[Severity: Medium]
What happens in sound/usb/quirks.c:snd_usb_yeti_resume_quirk() across
hibernation freeze/thaw transitions or if the driver unbinds before
system_freezable_wq runs?

Allocating a new struct snd_usb_yeti_reset and calling INIT_WORK() on every
invocation means WORK_STRUCT_PENDING_BIT is always clear when queue_work() =
is
called, which makes the !queue_work() cleanup path unreachable and prevents
workqueue deduplication.

During hibernation in kernel/power/hibernate.c:hibernation_snapshot(),
freeze_kernel_threads() freezes system_freezable_wq before
dpm_suspend(PMSG_FREEZE) calls usb_audio_suspend(intf, PMSG_FREEZE). Because
!PMSG_IS_AUTO(PMSG_FREEZE) is true, chip->system_suspend is set even though
usb_generic_driver_suspend() does not suspend USB2 ports on PM_EVENT_FREEZE.
When dpm_resume(PMSG_THAW) then calls usb_audio_resume(), a reset work item
is queued onto the still-frozen system_freezable_wq. In hybrid sleep
(HIBERNATION_SUSPEND) or if hibernation_platform_enter() rolls back via
dpm_resume_end(PMSG_RESTORE), usb_audio_suspend() and usb_audio_resume() run
a second time before workqueues are thawed, queuing a second reset work item
for the same usb_device.

Furthermore, because yeti->work is not tracked in struct snd_usb_audio and
canceled in sound/usb/card.c:__usb_audio_disconnect():

sound/usb/card.c:__usb_audio_disconnect() {
    ...
	if (atomic_inc_return(&chip->shutdown) =3D=3D 1) {
		/* wait until all pending tasks done;
		 * they are protected by snd_usb_lock_shutdown()
		 */
		snd_refcount_sync(&chip->usage_count);
		snd_card_disconnect(card);
		usb_audio_disconnect_components(chip);
	}
    ...
}

unbinding snd-usb-audio before the deferred work executes leaves
snd_usb_yeti_reset_work() active to send the interface-targeted UAC_SET_CUR
control message after usb_audio_disconnect() has returned, whereas
drivers/usb/core/message.c:usb_control_msg_send() requires:

 * If a thread in your driver uses this call,
 * make sure your disconnect() method can wait for it to complete. Since you
 * don't have a handle on the URB used, you can't cancel the request.

Would embedding the work_struct in struct snd_usb_audio and canceling it via
cancel_work_sync() on disconnect avoid both this issue and the module_put()
race above?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021231754.1692=
8-1-jasmeet.bhatia.us@gmail.com?part=3D1
