Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312DD4252A1
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948835; cv=none; b=f8sSNM2eQqVL7fAGYxJcCF6TpRTE4F6RmBNNWiFnqxTwTHt/slhPEK2N1y26EeK2crDS8KYyPQbOB215d0axRkhm0yLnFWVpmq4h2EDPHEWtkqthPP76DBIcu24j3xP5mK5UXjiQTbjk2Xz79gt7b+LypV0THgEAEzSSvGGslZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948835; c=relaxed/simple;
	bh=mzAix/5ip0Zopmow/9AHARQcTHnkWrXXhgyithcVSds=;
	h=MIME-Version:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Date:Content-Type; b=WwjgloSwZ2ySovJC9rnFwFeC1ZyW8ok2zG+x8NQNOSkmX852zl3AQKMSfdUd0iKKAF0eTZiqnEXYH1z9SS/MqnxifcRmPzUdNLyuNaJK4HSuv8OLM6dykEaR60EmSs6UMz6WBwBLe4MApCB0v6hWc3oPg5O9nSAzGy0it3wkGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFS76TIE; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFS76TIE"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2202204a12.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783948833; x=1784553633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:message-id:references
         :in-reply-to:subject:cc:to:from:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xQjdxZMKwK0/piRtiFV1AQ9KVJLXfDSp5HIDb5yZME=;
        b=TFS76TIEvEOgiczQf3hkLYgN7O7vzR7NqBOJdr/dKwZbn6pPc2O0dT9fekSEBC+ZQI
         f6Jt3cErFn7+Cp4vSKhF9i4sL8+b6mzHV1Modwf0DnQT3PDKmkRdIbdz5/fOaM6iD5K1
         bo82wGG6s1XIyY+H0tRkeAM0wZOcvKufV5Aup/00HYlojp5q6SdafsbrlTqTZwG07N9W
         YB453TWPIGxbXcgRmp9e/mwJiHD0WL+A9f+uV3CTEUwVegQ8kpJnQmXAQ+FZXdFgkaRz
         tHYztSEienpjpoo92rNJVbEqmYzgIyTJTacivnvV13PysKwMfqVSsy0ym0reQXzgLJGb
         QVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948833; x=1784553633;
        h=content-transfer-encoding:content-type:date:message-id:references
         :in-reply-to:subject:cc:to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xQjdxZMKwK0/piRtiFV1AQ9KVJLXfDSp5HIDb5yZME=;
        b=V23fHVnDio6hU/Rrth6Q8mm0e/GWsRt4bWpOU4fi8b3uDiaPasyGJuzzFcYKxEv0no
         0tgmA4YqRDhbgSbUR96f4tntBW5rq9Zq3wKYvEnQVv2uXKb/ZBSySngWbx9jakzSoCEj
         10+JIGLAaOkbTVhNQ4GY00igg+zk9RjwnDOUJca1zqwHVWGq2AB9wwZ138D6WpJG5YMq
         12K1M2JzZbqA8InBTWy2U9/DMbS8/sPnhSiiZNu3/qjUmF/wHA2LOq2CiupaAttLVkvT
         AKr7YzWSf1TH79GfmFu2XBYBbqUM26ym25fBRdPtOhixlRzwJnNLvGzjDH27N3exJ1SH
         vGFg==
X-Forwarded-Encrypted: i=1; AHgh+Rpo0kd6jPZePbHkcaJtj2YBIcBwv9MCCxvHcGLppiKKllaIqzN0EXAbxOHIw6AAMtgpX/l4LWd4hltOtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+jNMrO711ppWjNAVbszP5DA93zfxd2CYhiAmnU+phXhKpqhtq
	UhYCKmmF6BQfCmKeC7M63q8OSHZSvv5uef7JGNogOkXbLrpGQtgzNxOW
X-Gm-Gg: AfdE7ckzzYHZhzKUQZ5YRh5/hLBo+nRsHVKlnVYNcZPc1QCjYVf5zhfn5oagKKbdW2k
	kcvlJCusUQr5XhZox0vLd7rQJ7crxQWEe3osRr8FGmhyBdUoLDvRqr3+ojfy8mz9dLGsOdjwptF
	Xvf8ImdoI7b8MKIra8uuT06kMVT5lTLiq+re4gbLEwWv/xW8Q4sYQTlD45PuT1k95zwEoAdEKrx
	wQXB1BFCUuJUoZzUQN3RYNSjSwU1I+51/oRcB76Nk/vDbCzdeVuIUqfRLTWBWkG3tUs211P8KEZ
	she5J9lEjQ9eP0GRtkr4Gdql8pO0G+Tv5GW9qs2UUbtjY18ydjvmwMJlaVTuhdFsfIhkvOvixre
	NrNURm05L3GOTImgFr/sxGf1F28XTTsiHWX186RnWKGKlHFufNaPwUkSArbOZRqKMl9V28WZxaG
	e0KJod/eJM5mcgC+0=
X-Received: by 2002:a05:6a20:12cf:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c110762feamr9245794637.1.1783948833393;
        Mon, 13 Jul 2026 06:20:33 -0700 (PDT)
Received: from GordonMsi ([24.249.245.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm120679856c88.14.2026.07.13.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Gordon Chen" <chengordon326@gmail.com>
To: "Zhang Heng" <zhangheng@kylinos.cn>, <perex@perex.cz>, 
	<tiwai@suse.com>
Cc: <kees@kernel.org>, <jussi@sonarnerd.net>, 
	<hulianqin@vivo.com>, <i@rong.moe>, <g@b4.vu>, 
	<cryolitia@uniontech.com>, <pav@iki.fi>, 
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio
	 device
In-Reply-To: <20260713081048.189281-1-zhangheng@kylinos.cn>
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
Message-ID: <18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
Date: Mon, 13 Jul 2026 13:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2026 at 04:10:48PM +0800, Zhang Heng wrote:
> +		/* Generic USB Audio (0x1e0b:d01e): use SIA for consistent scheduling */
> +		if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e))
> +			u->urb->transfer_flags |= URB_ISO_ASAP;

Not a maintainer, just a bystander who was Cc'd -- two small notes on the
form of the patch, plus one question I can't answer myself.

A per-device usb_id comparison in the endpoint.c fast path seems like the
kind of thing the quirk_flags_table in quirks.c exists to avoid. Would a
QUIRK_FLAG_ISO_ASAP (set in the table, tested here as
chip->quirk_flags & QUIRK_FLAG_ISO_ASAP) work for you? It keeps endpoint.c
device-agnostic, and the next device with the same symptom becomes a
one-line table entry rather than another if.

> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> +		ep->skip_packets = 4;

The block immediately above this one already does exactly
"type == SND_USB_ENDPOINT_TYPE_SYNC -> skip_packets = 4"; adding the ID to
that condition would avoid the duplicate if. Also, the changelog doesn't
say what this hunk contributes on its own -- is URB_ISO_ASAP alone
insufficient, and if so, what does skipping the first 4 sync packets fix
that ASAP doesn't? Right now the two changes are indistinguishable in the
commit message, and skip_packets = 4 reads as belt-and-braces.

And the question. If xhci_get_isoc_frame_id() really does compute a
stale Frame ID for TDs at index > 0 -- because the frame has advanced by
the time validation runs -- then isn't that generic to any isoc URB with
number_of_packets > 1, rather than specific to 1e0b:d01e? The index=0 TD
gets clamped back into range, later TDs don't, and the endpoint ends up
mixing explicit Frame IDs with SIA. Nothing in that description looks
device-specific to me. If it is in fact generic, a per-device quirk in
sound/usb papers over it for one device while every other multi-TD isoc
consumer keeps hitting it -- and the fix would belong in xhci-ring.c.

I'm not familiar enough with the xHCI scheduling side to say whether
that's right, so it may be worth Cc'ing Mathias Nyman
<mathias.nyman@linux.intel.com> to get a verdict before this is settled as
a usb-audio quirk. If your device is the only one that turns the mixed
scheduling into audible corruption, then the quirk is arguably the right
scope after all -- but that reasoning should be in the changelog.

One data point that cuts against my own question above: on an AMD xHCI
here, streaming to a class-compliant USB audio device, I see no "beyond
range" / "Ignore frame ID field" messages at all. If the index > 0
staleness were unconditional I would expect to hit it too. So something
about your device's packet layout or your host's timing is presumably
what actually trips it -- which would make the device-specific scope
defensible, but that is exactly the reasoning I would want to see spelled
out in the changelog.

Thanks,
Gordon Chen
