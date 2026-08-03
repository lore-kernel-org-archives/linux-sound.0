Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86BC8EB;
	Mon,  3 Aug 2026 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748715; cv=none; b=LrcvpnQGzh5ZrOSFR32NF/Z/jh/KUPOaf/u/fFnQ/FVVJfmc8QI++u9x+AxQtuZFpy+QMbFMTHL1Vgvfa3ubWFd0rvKDoxcpKeObUWxfPkVX+YD6I1gTuFReKkCqaSbomvlSEd67Jz+lCNwulaBeT8vRy3ytoiM1HHHJc+Wiu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748715; c=relaxed/simple;
	bh=/68ak/+mqY372wtPZDb45XRcLEs/ks+tWxRJJcu7LIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=JKF2Zftj+7afY6SlI4IgpQcad0KOxjRy5yWRjbQ/K7eSmn4s94LCLyx0a1AQUpfzAy1Bt4rh4+LDvtCVxYCCLIa4/jEBxiTK7vgjQcDk5MGgl+/Qb5xgK9Ww27lUB1G/lbaMGcu0chJplfVVv6P80eBaWjBbV9nKKdRMpMFwmMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=Ct+v2gS1; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="Ct+v2gS1"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B7242806AD;
	Mon,  3 Aug 2026 11:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748709;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pflR3WlU1nnuLGWMxdR6yIcUoaGeYVVkzS1wwJoWk/U=;
	b=Ct+v2gS1ee3cdgu7pWf51Lc7+CcicvrkKUIX/QM2pyoLuksy1D2z4KVZLtoHuq2OuA0C6J
	zWmMd4xOCF7Y2YxY5sCsDzxGklwBi4qN7jgu02wo+DuYgriYPduFYEqb0meiA/CYSvcbgs
	HliHc2bacnSVpadhknJBoPBn3cMDlX9jLYcOCxw0imk5CZCOiGvAeNsVyjC6gbWTb3DWI3
	rF1cuM1HIFMQg/ZXmhhqn49I8DPvI7G2eewLuweB/d9c/1mQXEvjSOiOzwHm5rccZyEsnM
	HBoLJy0ecDCoEur7iiPMCDrh8UG7X8C5eDgsm1/9qD9DXQcPGHijuRXJ3Y3HcQ==
Message-ID: <ab0fe804-4e8e-42dd-a491-8d7f44e74855@cachyos.org>
Date: Mon, 3 Aug 2026 09:18:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] Remove some duplicate quirks
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Cc: Eric Naim <dnaim@cachyos.org>, linux-sound@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>
Reply-To: 20260803091102.107570-2-dnaim@cachyos.org
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Sorry everyone, I fumbled sending the cover letter. Here it is.

--
Regards,
  Eric

On 8/3/26 4:10 PM, Eric Naim wrote:
> When looking at a recent review discussion, I noticed that quirk existed
> because
> ALC269_FIXUP_LIMIT_INT_MIC_BOOST was chained to
> ALC269_FIXUP_THINKPAD_ACPI and could not be reused in that case.
> This led to removing the chain from ALC269_FIXUP_LIMIT_INT_MIC_BOOST
> and deleting the redundant quirks.
> 
> While at it, I also removed other quirks that existed because a generic
> quirk was chained to another quirk.
> 
> Signed-off-by: Eric Naim <dnaim@cachyos.org>
> 
> Eric Naim (9):
>   ALSA: hda/realtek: Remove ALC294_FIXUP_CS35L41_I2C_2
>   ALSA: hda/realtek: Add ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST quirk
>   ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from
>     ALC269_FIXUP_LIMIT_INT_MIC_BOOST
>   ALSA: hda/realtek: Remove ALC233_FIXUP_INTEL_NUC8_BOOST
>   ALSA: hda/realtek: Remove ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST
>   ALSA: hda/realtek: Add ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1
>   ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from
>     ALC285_FIXUP_SPEAKER2_TO_DAC1
>   ALSA: hda/realtek: Remove ALC294_FIXUP_ASUS_ALLY_SPEAKER
>   ALSA: hda/realtek: Remove
>     ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1
> 
>  sound/hda/codecs/realtek/alc269.c | 61 ++++++++++++-------------------
>  1 file changed, 23 insertions(+), 38 deletions(-)
> 
