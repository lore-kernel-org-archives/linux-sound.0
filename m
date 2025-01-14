Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6336236A6D
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859466; cv=none; b=WQYSy+HP4AH5cV6wO2kb2GGGVDxV5HXXtgbmuTVdx3IQ9upLIri6vVWi0tG14svFMGRFvouVEEqlWhUm+ubdVEDj6AU6PHNWVrlyn+uJdaswghqBL7ZXz6N3nzzwKZWnjiGXWfox94Nd/H5Fea4a1crMk11zywnR0lJ8JhuQnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859466; c=relaxed/simple;
	bh=1x/7oaeG6L8FPuYeWIFD0+aBqXPU1HCIcOurLrsl/2c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkjFKlau1ZKOnDc9/VnwPJFOkrteHba/TSw9zGdEfAbpzSCc7cmOWFAw7Mf62BmYOThr0+VAXRebyOiNrr8BuUwXTeF6SIwZa3ci7ktuKPTk4XhHLNEr9k6MhGi05x/39JUO5O3KsTA4uiDrEgytbyQ7Zkee/UlhonlHvO2cja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GED7tdgk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FNJ/HSUh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LzVQfzvN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nF5w3IWO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GED7tdgk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FNJ/HSUh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LzVQfzvN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nF5w3IWO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EAC521F37C;
	Tue, 14 Jan 2025 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736859463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0Raxzgiz7AtWIhBD6KlRXJR80eB3ToHjly+CNrK2YM=;
	b=GED7tdgk2wY50SndRL9YTjGL0WsREiFZXnDSxwkq48bdoOGOixdMZ+MzrzpZUUbUp4p4yF
	KJHjPKK+RgddmQFNaUsA1LvSFA3IQsOKSCTy8/HyrzXDA89R/ytw3QYmgP9I8GXtQKqV9f
	sxETjs8lm2DY848VeELAEc2FW4/z3zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736859463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0Raxzgiz7AtWIhBD6KlRXJR80eB3ToHjly+CNrK2YM=;
	b=FNJ/HSUhbN9rKP7O8NtgXRtzl2+8r7K2HPshOqd76srGts25E6if5cl9sPWkoFl7qUJ9Wj
	EaNf+7W8s8akBzBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736859462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0Raxzgiz7AtWIhBD6KlRXJR80eB3ToHjly+CNrK2YM=;
	b=LzVQfzvNMNrWW9raYRkqptDA447CKncjSN8y913j0dg9cxAooY229uGCeLJRID2mQK3CyL
	61bFPPDIaTTcG1J6zaTJB/ar1MBRnFuzwY0inSbzbn1auBzScJUSxTeNCDm21qANY7GQvG
	f/GxMaIN6PeQWBpXccavYh90iao65bk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736859462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0Raxzgiz7AtWIhBD6KlRXJR80eB3ToHjly+CNrK2YM=;
	b=nF5w3IWOgYUbUAQGM9P7PV7kn8KSXk6zVG5uLKFViOuyeUceWS5LufzRuHZWtw1SEy5ZMk
	XIxAF6yD8zatOuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D35A51384C;
	Tue, 14 Jan 2025 12:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 64ntMkZfhmdNPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 12:57:42 +0000
Date: Tue, 14 Jan 2025 13:57:38 +0100
Message-ID: <87h661zh6l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v6 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
In-Reply-To: <df86969ea91cd2a3dd07c0c63c00c5b97a4d8485.1736792486.git.g@b4.vu>
References: <cover.1736792486.git.g@b4.vu>
	<df86969ea91cd2a3dd07c0c63c00c5b97a4d8485.1736792486.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 13 Jan 2025 20:42:01 +0100,
Geoffrey D. Bennett wrote:
> +static int fcp_meter_ctl_get(struct snd_kcontrol *kctl,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct usb_mixer_elem_info *elem = kctl->private_data;
> +	struct usb_mixer_interface *mixer = elem->head.mixer;
> +	struct fcp_data *private = mixer->private_data;
> +	int num_meter_slots, resp_size;
> +	u32 *resp __free(kfree) = NULL;
> +	int i, err = 0;
> +
> +	struct {
> +		__le16 pad;
> +		__le16 num_meters;
> +		__le32 magic;
> +	} __packed req;
> +
> +	guard(mutex)(&private->mutex);
> +
> +	num_meter_slots = private->num_meter_slots;
> +	resp_size = num_meter_slots * sizeof(u32);
> +
> +	resp = kmalloc(resp_size, GFP_KERNEL);
> +	if (!resp)
> +		return -ENOMEM;
> +
> +	req.pad = 0;
> +	req.num_meters = cpu_to_le16(num_meter_slots);
> +	req.magic = cpu_to_le32(FCP_USB_METER_LEVELS_GET_MAGIC);
> +	err = fcp_usb(mixer, FCP_USB_GET_METER,
> +		      &req, sizeof(req), resp, resp_size);
> +
> +	/* reinit and retry if needed */
> +	if (err == -ENODEV) {
> +		err = fcp_reinit(mixer);
> +		if (err < 0)
> +			return err;
> +		err = fcp_usb(mixer, FCP_USB_GET_METER,
> +			      &req, sizeof(req), resp, resp_size);
> +	} else if (err < 0) {
> +		return err;
> +	}

You seem to have forgotten to check the error after the second
fcp_usb()?

I think fcp_reinit() can be better checked before the first fcb_usb()
call, just by checking mixer->urb.  i.e.

	if (!mixer->urb) {
		err = fcp_reinit(mixer);
		if (err < 0)
			return err;
	}

	err = fcp_usb(...);
	if (err < 0)
		return err;

Or change fcp_reinit() to return 0 if mixer->urbs is already set, then
you can call fcp_reinit() unconditionally, too.


> +/* Execute an FCP command specified by the user */
> +static int fcp_ioctl_cmd(struct usb_mixer_interface *mixer,
> +			 struct fcp_cmd __user *arg)
> +{
(snip)
> +	/* copy response to user */
> +	if (cmd.resp_size > 0)
> +		if (copy_to_user(((void __user *)arg) + sizeof(cmd), data,
> +				 cmd.resp_size))

This should be
		if (copy_to_user(arg->data, data, cmd.resp_size))

(snip)
> +/* Set the Level Meter map and add the control */
> +static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
> +				   unsigned long arg)
> +{
> +	struct fcp_meter_map map;
> +	struct fcp_data *private = mixer->private_data;
> +	s16 *tmp_map __free(kfree) = NULL;
> +	int err;
> +
> +	if (copy_from_user(&map, (void __user *)arg, sizeof(map)))

This function can also take struct fcp_meter_map __user * argument,
and you can avoid the cast.

Ditto for fcp_ioctl_init().

> +static int fcp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
> +			   unsigned int cmd, unsigned long arg)
> +{
> +	struct usb_mixer_interface *mixer = hw->private_data;
> +	struct fcp_data *private = mixer->private_data;

You can assign a void __user pointer, e.g.

	void __user *argp = (void __user *)arg;

and pass it to each function, e.g.

> +	guard(mutex)(&private->mutex);
> +
> +	switch (cmd) {
> +
> +	case FCP_IOCTL_PVERSION:
> +		return put_user(FCP_HWDEP_VERSION,
> +				(int __user *)arg) ? -EFAULT : 0;
> +		break;
> +
> +	case FCP_IOCTL_INIT:
> +		return fcp_ioctl_init(mixer, arg);

This will be:
		return fcp_ioctl_init(mixer, argp);

and make fcp_ioctl_init() receiving it like:

static int fcp_ioctl_init(struct usb_mixer_interface *mixer,
			  struct fcp_init __user *arg)
{
	struct fcp_init init;
	....

	if (copy_from_user(&init, arg, sizeof(init)))
		return -EFAULT;	
	....
	if (copy_to_user(arg->resp, resp, buf_size))
		return -EFAULT;


Takashi
