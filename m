Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0B18FC86
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787782; cv=none; b=cVwHoJ5gCHoTd8Xqa8jo2FbkMZD9azJsguVz1G8Jpsq7dkJiCJiuaVtJPW41OANVBqcpniSEVqcq+EKfNjkYGTFezw50dEgxff1XSAic0pCLExUFTY3sw+50G50KJczZMCu7qJwfn9/BXR2PNXOuH1XtmujcCSrkLSvg/Wp4vMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787782; c=relaxed/simple;
	bh=d5oQtQ8jpiv6Squ+ab7ufLaKlLfgZAKlrvhWJJUrbuY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FK2aAohKT3+roqzBpeFk4V5x1eaSECv5xAYt1muaUHw/i/poBrOCKRPxX2CU3ACx3YUjluAZkI8mVroeiCVutFNECKPWaMP78hh+epMWBxruWypFzb/FI5enLraWPZpQ9/Tgrxi+9FZAR5weZcTpfzjEgB/iYx4J2jgW7rejdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PFAb10j/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5gmCzoAf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PFAb10j/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5gmCzoAf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PFAb10j/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5gmCzoAf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PFAb10j/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5gmCzoAf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 374011F441;
	Mon, 13 Jan 2025 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736787779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOVfkbwwfj+P+QapJFEKtt699+gc0NgpKthLh3u8KgU=;
	b=PFAb10j/3sQySEf17Wydc9EM9/N4DetQV3Mx2Am6SPMHwUtDcm2/Bx7R896o9Yg5WeNkRx
	oduk/T93Bz7wELTl9rKF8NYJeG1DLNj0v/u5nDyO+fYJh0BBaXnV0PdfTS15+BhqBvLlD9
	LKVYifSGsfPhSn5TVFzejjayHRZ9bao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736787779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOVfkbwwfj+P+QapJFEKtt699+gc0NgpKthLh3u8KgU=;
	b=5gmCzoAfCg5rCHkhdzz7DEjfvw4wpPmfWdB1lkN1XV+e+92t6pDhrfQ+rW81fUvJCtZvzX
	id6P6XsOdq0a5uAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736787779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOVfkbwwfj+P+QapJFEKtt699+gc0NgpKthLh3u8KgU=;
	b=PFAb10j/3sQySEf17Wydc9EM9/N4DetQV3Mx2Am6SPMHwUtDcm2/Bx7R896o9Yg5WeNkRx
	oduk/T93Bz7wELTl9rKF8NYJeG1DLNj0v/u5nDyO+fYJh0BBaXnV0PdfTS15+BhqBvLlD9
	LKVYifSGsfPhSn5TVFzejjayHRZ9bao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736787779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOVfkbwwfj+P+QapJFEKtt699+gc0NgpKthLh3u8KgU=;
	b=5gmCzoAfCg5rCHkhdzz7DEjfvw4wpPmfWdB1lkN1XV+e+92t6pDhrfQ+rW81fUvJCtZvzX
	id6P6XsOdq0a5uAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A95D13876;
	Mon, 13 Jan 2025 17:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A3PnAENHhWeobgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jan 2025 17:02:59 +0000
Date: Mon, 13 Jan 2025 18:02:58 +0100
Message-ID: <87plkq1wal.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
In-Reply-To: <e2fa99cd1eefd2bd25584a5bfe93a21c643622dd.1736699490.git.g@b4.vu>
References: <cover.1736699490.git.g@b4.vu>
	<e2fa99cd1eefd2bd25584a5bfe93a21c643622dd.1736699490.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sun, 12 Jan 2025 18:10:31 +0100,
Geoffrey D. Bennett wrote:
> 
> +/* Send an FCP command and get the response */
> +static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
> +		   const void *req_data, u16 req_size,
> +		   void *resp_data, u16 resp_size)
> +{
> +	struct fcp_data *private = mixer->private_data;
> +	struct usb_device *dev = mixer->chip->dev;
> +	struct fcp_usb_packet *req __free(kfree) = NULL;
> +	struct fcp_usb_packet *resp __free(kfree) = NULL;
> +	size_t req_buf_size = struct_size(req, data, req_size);
> +	size_t resp_buf_size = struct_size(resp, data, resp_size);
> +	int retries = 0;
> +	const int max_retries = 5;
> +	int err;
> +
> +	if (!mixer->urb) {
> +		void *step0_resp __free(kfree) = NULL;
> +		void *step2_resp __free(kfree) = NULL;
> +
> +		step0_resp = kmalloc(private->step0_resp_size, GFP_KERNEL);
> +		if (!step0_resp)
> +			return -ENOMEM;
> +		step2_resp = kmalloc(private->step2_resp_size, GFP_KERNEL);
> +		if (!step2_resp)
> +			return -ENOMEM;
> +		err = fcp_init(mixer, step0_resp, step2_resp);
> +		if (err < 0)
> +			return err;
> +	}

This happens only after the suspend, and this is for automatic
re-initialization, right?

It's a bit scary that such a low-level function itself does
re-initialization, as fcp_init() will call this function again.
That said, it's more straightforward if the re-initialization is
checked and done in the upper level.  (And here check only mixer->urb
and return error (or spew WARN_ON()).

> +static int fcp_meter_tlv_callback(struct snd_kcontrol *kctl,
> +				  int op_flag, unsigned int size,
> +				  unsigned int __user *tlv)
> +{
> +	struct usb_mixer_elem_info *elem = kctl->private_data;
> +	struct usb_mixer_interface *mixer = elem->head.mixer;
> +	struct fcp_data *private = mixer->private_data;
> +
> +	if (op_flag == SNDRV_CTL_TLV_OP_READ) {
> +		if (private->meter_labels_size == 0)
> +			return 0;
> +
> +		if (size > private->meter_labels_size)
> +			size = private->meter_labels_size;
> +
> +		if (copy_to_user(tlv, private->meter_labels, size))
> +			return -EFAULT;
> +
> +		return size;
> +	}
> +
> +	if (op_flag == SNDRV_CTL_TLV_OP_WRITE) {
> +		kfree(private->meter_labels);
> +		private->meter_labels = NULL;
> +		private->meter_labels_size = 0;
> +
> +		if (size == 0)
> +			return 0;
> +
> +		if (size > 4096)
> +			return -EINVAL;
> +
> +		private->meter_labels = kmalloc(size, GFP_KERNEL);
> +		if (!private->meter_labels)
> +			return -ENOMEM;
> +
> +		if (copy_from_user(private->meter_labels, tlv, size)) {
> +			kfree(private->meter_labels);
> +			private->meter_labels = NULL;
> +			return -EFAULT;
> +		}
> +
> +		private->meter_labels_size = size;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}

Hmm, this special is a special use of TLV in non-standard way, which
needs definitely documentation.  The use is no longer TLV, just some
raw read/write of a bulk data for the kcontrol , after all.

Also, I couldn't figure out what exactly this "meter_labels" stuff
serves for.  It's not referred from anywhere else than TLV read?


> +/* Execute an FCP command specified by the user */
> +static int fcp_ioctl_cmd(struct usb_mixer_interface *mixer, unsigned long arg)
> +{
> +	struct fcp_cmd cmd;
> +	int err, buf_size;
> +	void *data __free(kfree) = NULL;
> +
> +	/* get opcode and request/response size */
> +	if (copy_from_user(&cmd, (void __user *)arg, sizeof(cmd)))
> +		return -EFAULT;

You can avoid unneeded multiple cast.  e.g. make a void * pointer in
the caller side cast from arg, then pass it to each function.
Each function may have an argument with the explicit type pointer,
here would be "struct fcp_cmd *arg".  Then the rest can be just "arg"
here as the address, and...

> +	/* copy request from user */
> +	if (cmd.req_size > 0)
> +		if (copy_from_user(data, ((void __user *)arg) + sizeof(cmd),
> +				   cmd.req_size))

"arg.data" here instead of the error-prone cast + offset.


thanks,

Takashi
