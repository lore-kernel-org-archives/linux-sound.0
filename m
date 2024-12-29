Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F914502B
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735462884; cv=none; b=oprZj3TQ4gBU8VGU0DxqEfTz8yLWch2CRPovhJOSyM/HnKxhV7YpP3eUavNsQqUoChhuP1g18UzOdfGN5Ez12bu/0SL8wmLJL1KvhGzYWiCW8x0EypYg6+8E5OUtEt/3RwDxfQCtYSQcglXPRhuYDOSUNOKzip64ErOV9dvzBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735462884; c=relaxed/simple;
	bh=PZWDWywaucH5BFlP5nIzvOl+nOKtapvyPCihVilocX8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4qtm9p23vqAn0OOpHMX1ZiKfn+AD2TI+XwYGr6kFjH4OEWxNXv87srmBFKlLFYaHAt5CK3ct14+Lz3VLHNM2FpKjQIq/Es8d4LdK9sAdh54aXVtkWsHQWIFFzRQoDOoLRLEHoG1CB39Y7edV3LsVVq6uab5mkZzv7qb1rA2FtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Df4Rbrgo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X0ufL+17; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Df4Rbrgo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X0ufL+17; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Df4Rbrgo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X0ufL+17";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Df4Rbrgo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X0ufL+17"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A977337AB;
	Sun, 29 Dec 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735462875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fe7cIR5vF8qLalCAcksMYIehvOhwasVdy3m3eoeTlXc=;
	b=Df4RbrgoTiu72MGsLUIM8D2Q0upPv2OeTGNh+/WxFenlf/zjjWXOGoQATMWwFv8SEFv5UU
	e0YnHLAKcOTg2C7X9DnderrFVoyjPiiqStaLt5y9ZbXNzhN0XfPuIES5PNM2GE6OwuV30H
	pP+KPS30JgMnbWI4VYEy0gbt+WxznfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735462875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fe7cIR5vF8qLalCAcksMYIehvOhwasVdy3m3eoeTlXc=;
	b=X0ufL+17uzWGtPdpqBjr2NQ810eUK2afzxDgqgOXwGHRv/2OQ0YRpgFFXuUkqwELgbcL1p
	Rvm2XPOj1syyq1BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735462875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fe7cIR5vF8qLalCAcksMYIehvOhwasVdy3m3eoeTlXc=;
	b=Df4RbrgoTiu72MGsLUIM8D2Q0upPv2OeTGNh+/WxFenlf/zjjWXOGoQATMWwFv8SEFv5UU
	e0YnHLAKcOTg2C7X9DnderrFVoyjPiiqStaLt5y9ZbXNzhN0XfPuIES5PNM2GE6OwuV30H
	pP+KPS30JgMnbWI4VYEy0gbt+WxznfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735462875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fe7cIR5vF8qLalCAcksMYIehvOhwasVdy3m3eoeTlXc=;
	b=X0ufL+17uzWGtPdpqBjr2NQ810eUK2afzxDgqgOXwGHRv/2OQ0YRpgFFXuUkqwELgbcL1p
	Rvm2XPOj1syyq1BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5394713A30;
	Sun, 29 Dec 2024 09:01:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dtyZEtsPcWdCSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 09:01:15 +0000
Date: Sun, 29 Dec 2024 10:01:14 +0100
Message-ID: <87jzbidfs5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
In-Reply-To: <3bbe9f8ec8664e36ca524649a7ec4c1356df17e9.1735159288.git.g@b4.vu>
References: <cover.1735159288.git.g@b4.vu>
	<3bbe9f8ec8664e36ca524649a7ec4c1356df17e9.1735159288.git.g@b4.vu>
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 25 Dec 2024 22:23:19 +0100,
Geoffrey D. Bennett wrote:
> 
> --- /dev/null
> +++ b/include/uapi/sound/fcp.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Focusrite Control Protocol Driver for ALSA
> + *
> + * Copyright (c) 2024 by Geoffrey D. Bennett <g at b4.vu>
> + */
> +#ifndef __UAPI_SOUND_FCP_H
> +#define __UAPI_SOUND_FCP_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +#endif
> +
> +#include <linux/ioctl.h>
> +
> +#define FCP_HWDEP_MAJOR 2
> +#define FCP_HWDEP_MINOR 0
> +#define FCP_HWDEP_SUBMINOR 0
> +
> +#define FCP_HWDEP_VERSION \
> +	((FCP_HWDEP_MAJOR << 16) | \
> +	 (FCP_HWDEP_MINOR << 8) | \
> +	  FCP_HWDEP_SUBMINOR)
> +
> +#define FCP_HWDEP_VERSION_MAJOR(v) (((v) >> 16) & 0xFF)
> +#define FCP_HWDEP_VERSION_MINOR(v) (((v) >> 8) & 0xFF)
> +#define FCP_HWDEP_VERSION_SUBMINOR(v) ((v) & 0xFF)
> +
> +/* Get protocol version */
> +#define FCP_IOCTL_PVERSION _IOR('S', 0x60, int)
> +
> +/* Do FCP step 0 */
> +struct fcp_step0 {
> +	void     *data;
> +	uint16_t  size;
> +};
> +#define FCP_IOCTL_INIT _IOWR('S', 0x64, struct fcp_step0)

An ioctl with a pointer has to be handled carefully because you must
convert it for 32bit compat code.  IOW, it's better to be avoided if
possible.

The same is true for other ioctls.


> --- /dev/null
> +++ b/sound/usb/fcp.c
(snip)
> +struct fcp_data {
> +	struct usb_mixer_interface *mixer;
> +
> +	struct mutex mutex;         /* serialise access to the device */
> +	struct completion cmd_done; /* wait for command completion */
> +	struct file *file;          /* hwdep file */
> +
> +	/* notify waiting to send to *file */
> +	struct {
> +		wait_queue_head_t queue;
> +		u32               event;
> +		spinlock_t        lock;
> +	} notify;

Might be better to define outside with an explicit type name in case
of code simplification (e.g. factoring out the struct init code,
etc).

> +	__u8  bInterfaceNumber;
> +	__u8  bEndpointAddress;
> +	__u16 wMaxPacketSize;
> +	__u8  bInterval;

This is an internal struct and should be types without __ prefix.

> +/* Send an FCP command and get the response */
> +static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
> +		   const void *req_data, u16 req_size,
> +		   void *resp_data, u16 resp_size)
> +{
> +	struct fcp_data *private = mixer->private_data;
> +	struct usb_device *dev = mixer->chip->dev;
> +	struct fcp_usb_packet *req, *resp = NULL;
> +	size_t req_buf_size = struct_size(req, data, req_size);
> +	size_t resp_buf_size = struct_size(resp, data, resp_size);
> +	int retries = 0;
> +	const int max_retries = 5;
> +	int err;
> +
> +	req = kmalloc(req_buf_size, GFP_KERNEL);
> +	if (!req) {
> +		err = -ENOMEM;
> +		goto done;

You can use cleanup.h stuff for code simplification.
(Also for other possible functions.)

> +static int fcp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
> +			   unsigned int cmd, unsigned long arg)
> +{
> +	struct usb_mixer_interface *mixer = hw->private_data;
> +	struct fcp_data *private = mixer->private_data;
> +	int err;
> +
> +	mutex_lock(&private->mutex);
> +
> +	switch (cmd) {
> +
> +	case FCP_IOCTL_PVERSION:
> +		err = put_user(FCP_HWDEP_VERSION,
> +			       (int __user *)arg) ? -EFAULT : 0;
> +		break;
> +
> +	case FCP_IOCTL_INIT:
> +		err = fcp_ioctl_init(mixer, arg);
> +		break;
> +
> +	case FCP_IOCTL_CMD:
> +		err = fcp_ioctl_cmd(mixer, arg);
> +		break;
> +
> +	case FCP_IOCTL_SET_METER_MAP:
> +		err = fcp_ioctl_set_meter_map(mixer, arg);
> +		break;
> +
> +	default:
> +		err = -ENOIOCTLCMD;
> +	}
> +
> +	mutex_unlock(&private->mutex);

There seems an implicit ordering of the command -- FCP_IOCTL_INIT must
be called before *_CMD?  If so, do we have a sanity check for that?

Also, the behavior of *_SET_METER_MAP -- it dynamically creates and
deletes the meter kcontrol -- can be a bit dangerous.  Can't it be
without recreating the kcontrol itself?

Last but not least, any need for suspend/resume and disconnect
handling?


thanks,

Takashi
