Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793154997;
	b=HZQR6ONYqc8hIgWD4u/G7SJ1ey4Jirwc3Sm9mtpmqChjAw9QODqra6vqFjQUCpeWxEVB
	 bXQiQSKz2AIeCpuclttWjRzNJM3KoKyrGb7A/G/iHaznH83bXFxlMyepN+8G4P6kTfaRA
	 52YSRbRNm+yII/0LMKos44YbQSLzpKCmgNCos3GZlCXWfTFgYykQqe/6mDvX4kViRaMbw
	 cYTFEJ/U3fb23gsWy0Q4yT1HeG111aQdmQXdKtr+4qA3qUNOQuhpxPhO6/Ngwkqw4N0tO
	 xdOKSK8h13i8rGFDll3xkgAbNLOjOwMmM/AoG++T31QGJ9mxOrvncz6x1bdcKCVjVKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
	b=W+SzMiLRl/32cQnvo0c9WiGK2pCjWBT2kRPw5HFXkr4vCY71hLRcodinEB5oXAq4xHPK
	 /+rULUg7UpIayogVLpv8286Azv5fmmyonx/rEYFCtRLKfUU41rbfEa8a1IA5uw7YWLlQV
	 YWNo3nFgr3xM7S7Fo4FALTK6HViOJMQMKToKWEVScN7KwqfBHq+ENaimoR88tgdRG7hYm
	 58MHYx0UnvNltALl2fJNBnRsMkrkbYKZrb0tfeIPg8C1WSW6X64/E/Vuy2e1kB7ogqZ94
	 qtqUsI73DvmwnK7p6c2Ofeu1EY4XB8DBuLD1WOaINeUxsYiCp5jl//kzGoFyYUs3CRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzFZ9jOz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A3606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzFZ9jOz
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so456777e87.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793154995; cv=none;
        d=google.com; s=arc-20260327;
        b=M1Bd9wfrMMpq2QGQLxv8fSEoHpwfWvE3PpEPURnQpxcP4E+kcncqwYlemT7D+uv+Ox
         fmlC25385MucDzEsvHIwYTww2dPeSWM2rywewm2aw7EMzzAGRDnqsf0rgMqDtQqOf3Ot
         8UAa8X5raCBPMFNaITc6aJBZEQ7JopL1tRQeXTMRZn/TT42UB2VBnWsVTVIUqr6fF6f3
         f9Mf8KUwSrZv4u2cNSItBlKq+Y7VeIJdgX9rkD7CZqZxrR+DOn/aX9xWN+JGwzaR5q3x
         bSGcJD4KiX9IkOM4mGIvp07P8GPABhiHCSkKQPiDq/atoiYWHpyq8Ade9l+vvMH4uLbD
         zaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
        fh=UX2NJkwGz5Kfe9yb2QOx4PnF+w4Z1XWRhUQemk5Tz1g=;
        b=OfMTzxWW74Y19oc401O+TsZ7Hd8eOBeKA/d0a3131NBjoyompCMM5/PvcA2MWheo2z
         gypBlB1OL+ZrVYMnkuXyC53Xbf4RLhOmRj135flu1BaHNRWVm0Piat9ai45rwrT+9vww
         kgGS76EWQ5uG35xD6AUpwydMnuqWsqlL2eiJgWyqQFt7Bfd247r6CENLRcqjAmKDqOPz
         EOc5XBwTJ0mFebiLEV8mvMtwMBzbp6Zt8D2eg8+bSD5zUHaOWwTsyhMbegK2hU4SEr50
         GwGA100q+HuqyZu32nWBj2YwNLQXwn9V3GEx1n4hGVky6Kg75V3SAx+W7I6k1p3bqmnv
         vOSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154995; x=1793759795; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
        b=rzFZ9jOz7i2ac77OXVlgf1fvPX9Ab3WmJDWVqROiaTpFbXiDNBhs5VZxiGMMLKN3aj
         dZa/DN0xBMih0J3m4+GpEVZWTxGuXNcj/m7F/gquHRukMYpL1nNLgQYb6KbBimGqxDQ2
         InsKa5HhiU6xOKyejzeIDhnSehEDGXeR+GdxApvUmyMxcdQahu/aRY2KnFj6wfeVfSBf
         qkhyxOeAk4dDN1CZdDgG/ESvL5hIlRRUskU346lY4CwGRbQs8+xG+/8IMgbosuBU1F5h
         DcoWZzLhrEFKGytxqHCZa6CWJGdEyAS7zMeeUV1RZQJ6y74+pp8M+GBOcFpNaEMW/KVl
         vaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154995; x=1793759795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
        b=aEotX9jRjkxjmTjvLCu5gvQ5YExTpVeBqMizV3iE3HWnlTl8VNlO0341+jhVff+snN
         dVHPy+QyCVpSVtOzlnJ9qIP6s5dQYb5mrGuc9+56mMYE1Y86FF78bQosWo/2Zser9ENp
         vmI/augS1wWnb7SJ027iumyPieJPOeqgpWcSN4X9SWcqdjimzxsPs998stfRojAWmeNY
         uPR2GxgtwNEcdpAW14wXnKQZyK/8qIHpYk/2YzjsQ+/4d3reKa7RWcIuFH8iyHQtMXlG
         vnF/TeqaVsaVlaFBT7HVZmRiR3YeoSmPP6UExQBGIB2ill2Sj6SuMB8o3huWLYYS5sEe
         8quw==
X-Forwarded-Encrypted: i=1; AKwUvByflTwhL3FPeG/RG6hjsSilDAx9//ZuW1l4q4pHuNG9AqIhG9x6VLE75cF4NAa3h/s330JhI85Rv8RUZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKl8rrQrLkUU5oi80ZLie94qEHhoHlPbSfz/+n0iu+nz1+Tir5p
	vYDlFIc8NuZaL82JliErWydYpWdJO1yGMeB5bctoOe5dN+TnWj+SNsT6+LeAnsodoYNSqfzhs/T
	S1XualiQFxEqGs5ChzKU2olp7lBeqS+nt7az2
X-Gm-Gg: AYBFou2zaMyCz+9ghcjnROpjFpVyazHPBdtHeOVP3u6z3LeRtUI1sAkaaVomT9pjP1o
	jgtdAeFE6yi8yiyUhgNUP+TcpuFWr267kf8exAKO/CfpF/oCwck6QSrWVuPl2d+FQEomNpnLsSA
	ljlzjeRPC/C+3wCNDFEwtOI11LTcp9BCSFbqouT+caQmrlWn8aoguL45KYbtD4qdXnl30rpKCv1
	BDsMqVkCcmCmXc9S1ijFw9i7cfyFydQBbu2VfIfHc0pQJ+BH3z1EEnp5/Tm82+3jr9WKK8i34A+
	JyPdmPo+C0mArm2mcCNsoa5K00K7cnoQCO5Hzy2BqK3TUPFYg6yrcaHSTRY5VEF+FlvHT/1lCTs
	hiypf0zInrEABIirurdbRAGjdFJROgnn4tjAUmNB9Nz+LaLtrK8fJ66ejKUlf5BDmhqZXz1NKNN
	rX7dfG2Q8EK1eExxk/
X-Received: by 2002:ac2:4bcc:0:b0:5bf:bfa7:cd33 with SMTP id
 2adb3069b0e04-5bfcacc8d0fmr434647e87.8.1793154994755; Tue, 27 Oct 2026
 19:36:34 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230159.834954-1-mrwillporter@gmail.com>
 <at-dpPOGs2zD2fuL@khmer.arcnet> <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
 <auEyD23PT_kpJsrJ@khmer.arcnet>
In-Reply-To: <auEyD23PT_kpJsrJ@khmer.arcnet>
From: Will Porter <mrwillporter@gmail.com>
Date: Tue, 27 Oct 2026 21:36:23 -0500
X-Gm-Features: AclHuK-MYfRR2Ytpzl3UFpBwLNrsz8gDJW_Gm_bBh87oewtYdi1oUomSx4Y7hwY
Message-ID: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Andrews <neil@androos.io>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Wed, Oct 28, 2026 at 12:21:51AM +0100, Christian Ruppert wrote:
> BTW: the mixer matrix seems to be identical also for the EVO8 so
> chances are it's the same for most audient devices and we could
> simply use a width and height parameter to generate it in a loop.

That sounds good to me. On the iD14 it would be 14 inputs by 4
outputs.

> My view of the WO implementation would be to add three flags: cache,
> init and force_write:

These look right to me. As per-control flags, you could set init on the
EVO matrix, and for the iD14 entries, could we set it only on the
write-only controls? The matrix, routing and readable monitor controls
keep their values across a replug on mains power, so I'd leave those
untouched at probe. Would each entry also carry its init value? On the
iD14 most start at off or the first item, but optical mode starts at
S/PDIF.

I'd keep force_write on the cached write-only controls, as a precaution
against a reset that leaves the card registered. I haven't seen that
on the iD14: the resets I've seen re-enumerate it and run probe again.
For the readable controls, skipping an unchanged write seems fine to me.

> - The intent of the control types was to associate unit/selector
>   pairs with data types. I would add a new ctype for each
>   unit/selector pair [...]
> - I don't have a preference between explicit control names and the
>   basename/suffix system the EVO driver currently uses. If you prefer
>   we can simply replace the basename with a full name and remove the
>   flags field in the controls.

Yes, full names would make the iD14 table easier to check. And
one ctype per unit/selector pair is fine with me.

> - The boost switch writing 0x0 for 0dB gain and 0x0a00 for 10dB gain
>   looks suspiciously like a volume control between 0dB and 10dB *
>   256steps/dB. Does this control only accept these two values or can
>   we simply implement it as a standard volume type controlling a mic
>   pre-amp?

Your guess was correct! The device answers no RANGE request for it, so
I tried intermediate values with a loopback cable: 0x0100, 0x0280 and
0x0500 gave +1, +2.5 and +5 dB on both mic inputs, each tested
successfully within 0.01 dB of nominal. I didn't test outside 0..+10 dB
though.

Even so, I'd like to keep it as a switch in this series, because the
iD14's documentation describes a fixed +10 dB boost. Your max-for-true,
min-for-false boolean would fit that, with 0 and 0x0a00. A 0..10 dB
volume could follow as its own patch if people want it later. Does that
sound reasonable?

> - We definitely need a new snd_evo_type entry and get/set functions
>   for enums, up to you to define those in the most suitable manner
>   for the id14.

OK, I'll write the enum type with the iD14 tables.

> Sure, error management is always good to have. [...] Also, for the
> controls I checked, the EVO cleanly rejects out-of-range writes but
> if the id14 doesn't we should add those checks as well.

I haven't tested whether the iD14 rejects them. Could the generic put
handlers reject values outside each control's writable ALSA range with
-EINVAL, before converting them to device values? That would cover
both devices.

> I would definitely prefer to list both of us as maintainers.

Okay, let's do that.

> I suggest I submit an RFC with the generic part that you can apply
> locally to work against (and potentially adjust) before you submit
> everything in a final series which, if everything goes well, I only
> need to retest and tag.

That works for me. I'll carry your rename and generic patches in the
final series, with your authorship and Signed-off-by kept and mine
added, followed by the iD14 patches. Are your four fixes still going in
separately first? And could you include the base commit in the RFC?

Thanks,
Will
