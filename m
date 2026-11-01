Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793571842;
	b=my3q3NBS5wLUa4HwrBqinrdaRA+uXd17CFMXjZbvxr64zFRubJr4HeeBvG4MImY8xaHl
	 LRXGASnjwrPKCXYAzQKllh7ZMa7JMpYjTZrT5roMtyqqIM/kM8iYEWGNY8VedFzxiXAsy
	 m7G8vM8lQU41oG+o6293QJDGHt1BQ9wqAIWn7wOyP56ydU9SeCizyuadsZ0dUFdOpIpNL
	 aJ4ZvrZyr25zZ2MQo6tdTvcFqOz+uoWIM6rpmf7/3XnuXyfizbwgAk6WRGVJatp7YOv0/
	 LVjuqXX1AQQFvYC/a+xyXlJI6zhVs7OH7DUD/gz7kQc1Q14ulTK9L4wkSD6Q0qZYKtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571842;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=XmkxEUyDLhutAtoF1BW6+bQZx7sL3ODVy9iJp9IMcMQ=;
	b=r2ILjiXY8Uh35sHgSbVrhtP39lwG2SCAgMf+fMeXcdqdiQF+IZE39Lj6QlDhMerS8V9c
	 UyxST/qfCUncffaRXITn/vmxyPfHaFewZOWpKsCnPbPPy5s/DXsV+F/+plAZ70E72VJXM
	 CMoACsAuM8nv7oQm+0by1m8qb7Z48/Z+NmIoH2Zn1FS6Lrwt/HvpHh03KcynGPaDYMZjd
	 eI0Jq1ZlCjx5PqB3nr2IaG1THSBwGOMdfiLCXpsIW52XtQoQkVQ8WUjD6HZ1WC9w3HXTK
	 bfEmccM37MgKCG9lC3zfi/+68hCuC7z308pvkCODOKoLd4okyQ0dIQqWaCkoXF1b+VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=T6TNXF84;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
Received: from mail-200170.simplelogin.co (mail-200170.simplelogin.co [176.119.200.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D7C606F2D3
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 22:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D7C606F2D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=T6TNXF84
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793571834;
	cv=none; b=oP6zh06u+DMc2Pz1RW5rYufJao4Avc6D/DAecWhf5qAZL6M7m2fxqVKj5Wl4ihA4iK14UdkoItUks3aND/8+6JPF5PKnJqLYAPeaqF0V0vrg9abwroI7L+GPRCkd4URSnltxq2GRW/2VfjtjZ6O0tIHjJxSG61TbCxi440hwuZCqMEW5gkR6EIJGVgEU3vnqlV6JuwWBJZBGJ864GH0Prs4+3EmecJrtw9yJ4Jmedt9bNEB5HJBstNsEZtctdFb9YaagiRq0CtAxsfdJbDAi57LtVM8eGfjr3p/hpHG1rG6T3lISSnHEa8HHePypvuMCbqe6lt1mzLQj4w1+9Y54jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793571834; c=relaxed/simple;
	bh=VgX+PmkF5PZySZVrNyMesJ62oduLpFWpQgpB8NDgA4M=;
	h=Date:In-Reply-To:Subject:From:To:Cc:References; b=b+mHcpsNUKolZrHNYv/Lmw02riGiG1Fdk6Y0YUcmJVDne/KEli7q6kBfvbu628uipJYgEyn5g3QiTM1p70IF12iHC7dLCt1nfa/BMe79ivVtFeddSVi91iGHCaRogvMSgPNqlgLGlJ8JVZZtkXTrGT6zWxLzxNEVqV+AZ0sBkHwNYPD7EGqcIm3rJxTZwGK6axbCaKCkHw8PsnUPsZR7ALKU+3F0xoIFTa2i0WNsa0R4iiVZHW4o9Df94k2dHtqZRcNi/0CLsWdnDk7xb2MbptSUZQK7/Ss4DZDrwkX1wXp/+mpf5AnbQid0c6fVI03RyrYYsTLbb4i+obghfkr9Eg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793571833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmkxEUyDLhutAtoF1BW6+bQZx7sL3ODVy9iJp9IMcMQ=;
	b=T6TNXF84fMHn2g1sAX3XnGPOUFXcEoitQYQbCbhlx/s3Phy+8MN1j6GEjDKIPQIPUzSlv1
	DtJH8XT4vZQUCD5VZHcyANagWQEbxgU6a2P9sT5i7vmfRa1nl4mlfLDsOkuuwTNErrHU7o
	GpBHFJ+sSjIH3EzqNw2xZGEltJSzYpc=
Date: Sun, 1 Nov 2026 23:23:51 +0100 (CET)
In-Reply-To: 
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
Subject: Re: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: linux-kernel.supreme403@8alias.com
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: tiwai@suse.com,"Ding,
 Shenghao" <shenghao-ding@ti.com>,perex@perex.cz,baojun.xu@ti.com,kevin-lu@ti.com,sen@ti.com,matthew.schwartz@linux.dev,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Message-ID: <179357183245.7.3137161079355845805.1738723974@8alias.com>
References: <P3C8cUq--F-9@tutamail.com> <P3CEBDi--F-9@tutamail.com>
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1738724008
X-SimpleLogin-Want-Signing: yes


Hi Antheas,


Any news on resending this patch? Is there anything you need from me before it can move forward?



Thanks,
assembledev



> On Mon, 5 Oct 2026 at 20:04, <linux-kernel.supreme403@8alias.com> wrote:
>
>>
>> Hi Antheas and sound/TI maintainers,
>>
>> Resending as plain text because LKML rejected the previous message for containing an HTML part.
>> ...
>> Limits: only the primary amplifier was read on hardware, and the final register snapshot was taken idle. The listening result is subjective; there is no calibrated SPL measurement or controlled same-volume A/B. Current mainline and for-next were not built and booted as full kernels.
>>
>> Unlike the January Ally X test, this machine's OEM and firmware layouts differ. This report does not claim to fix the Ally X's separate symptom. Commit 4fe238513407 introduced the custom-node parser with the BASIC-only assignment and appears to be the appropriate Fixes target.
>>
>> DSP SHA256:
>>  a29f522c22cdb203eb1af84846838b5ef76c3a2c721760c7a898dd35f9ce1430
>> Public firmware:
>> https://gitlab.com/kernel-firmware/linux-firmware/-/raw/20260410/ti/audio/tas2781/TAS2XXX10A40.bin
>> Original patch:
>> https://lore.kernel.org/all/20260107093134.583873-1-lkml@antheas.dev/
>>
>> OpenAI Codex (LLM) assisted with diagnosing the quiet speakers, validating the existing patch, preparing a local reproducer and drafting this hardware report. The kernel change is your January proposal.
>>
>
> The Ally X had a different issue so we never merged that fix. The
> commit body would need to be amended but we should be able to merge
> this.
>
> Does anyone else have any suggestions? If not I can plan to resend the
> fix in a few days. I will not be able to do the testing for it (no
> affected devices)
>
> Antheas
>
>> Assisted-by: LLM
>>
>> Thanks,
>> assembledev
>>
>
>


