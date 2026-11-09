Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794193208;
	b=46bMtuoKYbbTAl24KZ2Xw2UoB9KqLCkffAJ0YdpK7Ee8SHqC85OQ1m6D/t+HD8ImQ74R
	 El7XkSBVnnvnAncwWa9fRB+KcoGJKeZR2LVMSFdwRdoNf5p31qAMVYtJjgIyL5bTtTMff
	 26W42rEyBnn2rTCy37q1n4rQ2fRa+j1Flb47Wi8V3972extBwWSCYWn7VLKEKpp7mz3NT
	 QMOrKNTpV5+Cr40hhjo+nMd+GABgYqAPO4W4u7Sry0y3MnM6yJ365LCMxQ1wY2kOb7ZzA
	 9R4nPqBb34T7Rf2n//KiqsCRY7jm3vmpv2TIiJfIYSKaSx+IjE+Z3m+iNOvkm19viDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
	b=4l7/HQ8zYSfujNpj/7aUidEHgFHUzc55yysGkP3tjavoF3THqpicxRaFhDhDbCuJ6Uzt
	 QHSRSUpOmaKnFZhhdlIQ9HtbxVkCx101Dwmgc1wJLJbJWmNvA8TnU+l3bdZTB9RLujIn5
	 hv/fGNELasmzBAlh02vbyNlOLKpm0WNPSk3JtI1Kf6v2kZJ/V98HqfHQI/VMJa5t1r9Qd
	 rL2NvRAkEcvuUwcxrM90/htvvn/396VJz12j+/mSGj5QusQBj5t7d/YDUmcCbZeMnsSkA
	 4HIabusKrWV6thKuvWFA529pcHzBbuLE2GYD0G3sY1tF/ofkX99uqLy+OyoLyIt3+bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+bxX3ai;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E553E606A330
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 03:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E553E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+bxX3ai
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so218823b3a.3
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 19:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794193207; cv=none;
        d=google.com; s=arc-20260327;
        b=QiptKnugyThSVhdJrzVIzDkveyldzEdU83/WMY5BcrX6L0m2xzi7qx2SC03fqLiuSU
         aFiT5nWt7PgwVnQUDvgVNH0A3v51Sr5waSDqztxHMdkX1lBerPUwwLn1jrifQ3XP1zVb
         o4INxSbL+l65vlPIrnv3bp6ZgY1DAVizPsWXc3ErzT7agzXvFz2LdAHibg4pOydkwUiW
         5dq6jCyzmDnpZgXZ5Q2xQ4DA7pECbvAptCamfLedrijyF+/8+7QkI6hYVUVCQTh8RYGB
         YxqkVTV5TZJ4Qv2UmT42qEw1/am45t6zbxSQqBX+LRwpTN5HGDTYZnVj0s+/ARgKDzO0
         L2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
        fh=ix5YWTHPksoVKb9ZclaX9hdFFUAcudPFtpmEshdfF0w=;
        b=YcI4CnGHVoZ0TyS/ix/FACuwB+AAYOnfgKrrNZ3crTGsUlytdkleflbHIZFAT9+DPY
         yxJjARLKsLwxWwzn+FgshUTncgMf+F/hWbEJ2iP739OqKrj2wb0R7aJKY6r+D81lSIAP
         Xv4VODxuLyfvMeRDo0EwHOlsL+Rxs3r1Oy39EDq5+6MpAdmP+DS4f96xxvPXFyZ5m/id
         EAzCB/4vyFvtZIjROlsrZrWFlIdasmpXD9T53VXchzhEg7Am6DgHbhoJrvQMsF8GNku9
         klsk3UbET+QUiQDW306erKiJP8XeUsS/ivQ1m6JFGKYeAAw3IrQjPl/AfWcfiNymjg3n
         ileg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794193207; x=1794798007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
        b=y+bxX3ai8KYCE9IW7qhTIeqvh8yZXrVeP8UrGj46bPBWwcXc5ZOkAUGW0mAPRy+I7e
         i6Tb4VArI6CNG1olUo1HP/UHqD47hHUSBqYBT8DOyB7XBisnHRN6+A8pD/ZfgvlrkR0B
         oIWUS4lAdz375d12AlfUja6O6qDKXqIrtehFAnTuax4/FYOvKh1xAzso6556z4DfUeuN
         QlTKHvim4RVupkWk0FNqFlX5WV5XSkY3KHWxK/5Rs/jHJF9hV+/HQbaBAawwjSINZBlt
         PFXew8hIfwijS7sXuw/c8MPeph+Wpz6Zx48R28eHeewi7/k8e7eaNksVaOVZZ7lFopp5
         3nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193207; x=1794798007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
        b=OZsnUZnGMhvDcLuEpFFJqIXOwuksiyFOVCKPrZ+BKpFuHVrFULYKK0VYLF3Cvd+TcK
         f2B+HVR96cLY7t90Xlljk+ZXBy0uBD09CeK4E+1huFRjHvy20mFx+3sfJ3tCZ4Xt47aw
         rXJoo+E1NaCHFW3WYKtYVu3i8btFKmHYcUkezFWryxn8WDWEoQWVufTGb/x/Bv6j8PlY
         XYGgjBYI4AiJShPsENuwx3Cut32vmiLufHCFVwczdMKog8s9N4SVQGMFARnkILsohnnJ
         ASouL1sXNarYOiGmsOG5eR/A7O6ScTlx0EHB7MYZx0Yu0iXbDD3tOaxzlhKksolwHHF+
         UMGg==
X-Forwarded-Encrypted: i=1; AL+hErFfMVlFhTGxriVQB7lmGGBfv1OFLjrGw2Jmytm1nOR/Ppl75uxeM9EdKBdt+edtjjJcmEUoenEO4QPtiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rc6VPPQg3u6VcyteNMMDrHLICozcstajz2I8/4EIgNhCrhHs+
	yPXO6Fy54C4nVfSeQO76w9OX6n6OjDzwhv2ku5UKmzzPxIXSHXUkpO1Rk8lLY/0AUw/tJgsRe6J
	xbqqpyPYmNM++QEP8O44dRUevlMqjZ1w=
X-Gm-Gg: AYBFou0Z9YtwVVzMAtfcF1Iq52JWqPvjzt5OEReSNAkAho+wwObn17NFu4APTZZOdmr
	AS4QqWMLrhUUUa65Coicf5FVM0mKVlroQVMVADxm9UXSmoH8iy7xAvvcJuLTxNhVZuyU41+4Cwr
	s6xKYL5plQyHz5RuvN5bj8FMXP3CBp02ZsvHF7fe9qB9d5dg7oDR6piZaOtjpM7PYjqdH45V6+V
	Jwma3BsYCc3vnjqMC889AVCsw/jlMRcJsA3Q61CSFAjczJIZ7FN3tKu2qG6drPR1v+RAaaRX5Pw
	BynSWa2/HyiHva0hNZ00CVYgSWzVznRI0eWSyvzcaGxXw7wlCaKAFeD/C2ev9cqBm+hANVUq0Ad
	O/hZ8h8jgHDL3L1g9xjJ13EVWF14dwqisE3kROOeyEjloH6n7XygH0+hKpYd3FjTr/8y9GeiePE
	py/ayWGOTZpWDzbNAUYe2GLvqXtxlVnzsSZc6q8H9WNh7F0PO0
X-Received: by 2002:a05:6a21:4d91:b0:3e8:b7fd:6288 with SMTP id
 adf61e73a8af0-3eed4abf08dmr2669803637.41.1794193207119; Sun, 08 Nov 2026
 19:00:07 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-6-phucduc.bui@gmail.com>
 <179414671638.3711751.18312173137946049928.b4-review@b4>
In-Reply-To: <179414671638.3711751.18312173137946049928.b4-review@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 09:59:56 +0700
X-Gm-Features: AclHuK-EvGw9XekZUddhG8nuhu6eLUFFK5k4EYs7hzNBjaDq8KztxIaIawGbN0E
Message-ID: <CAABR9nHWkQdXi=wN8eADuCPhuwURgJ86CuwNiieJvUOBV6xw0w@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, 
	Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

>
> > The underlying functions already report these errors deeper in
> > the call chain, making the additional dev_err_probe() and
> > dev_err() calls unnecessary.
>
> >               ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
> >                               pdev->name, dev);
> > -             if (ret < 0) {
> > -                     dev_err(&pdev->dev, "failed to request irq\n");
> > +             if (ret < 0)
> >                       goto err_assert_reset;
>
> request_irq() logs some failures, but not those where the interrupt is
> just missing.


I understand.
With platform_get_irq_optional(), a missing IRQ is not considered an error,
so no error message is expected in that case.

To handle other IRQ retrieval errors explicitly, I'll update the code
as follows:

------------------------------------------------------------------------------------------
irq = platform_get_irq_optional(pdev, 0);
if (irq < 0 && irq != -ENXIO)
        return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");

if (irq > 0) {
        ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
                                               pdev->name, dev);
        if (ret)
                goto err_assert_reset;
}
-------------------------------------------------------------------------------------------

Best regards,
Phuc
