Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F6375AC6
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141536; cv=none; b=EEKkTTX1MhytjhzDnhiwNjDJog49ecMhglbiJ+aeepR5quKpbnaZrKkuHZnGCi37V1RsvMzBRO88tXmmwKD5quDN2gXPcN4feWI7onnH1mEGLdcXCdwH66JbE83srw8UMiqgCeyhdcycej/WWWK4m6h05jgnAAHPpU/t8YDb5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141536; c=relaxed/simple;
	bh=eO98CC1dq9xwepVqr0m1in8xGU1uGdR/vd48GlAlx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KViKtTvaKgMpo/o2Kn3aj83CUN49JQXZW4beN0QR1t7c/Ih5b3XKZj9WIisjH3+C/xXiw1GQEH27kkjUo+mAsoeAGwEbkxOKyVLC96sIKsCyiZxUXXDiMU13I3dMzmg160HmD6GoDwaGU0ZwjAdq9ebG+y5R0dSdsCnv8xuI/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6QUJmDR; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6QUJmDR"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-519e7faecf1so42512361cf.0
        for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141534; x=1782746334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/6cLw2+muN50gac7bA2Xzn5QQf7rCJUO16TP8tP150=;
        b=e6QUJmDRHXFIReAbVdxh3LMsnkhSYcpTYjyzw4EKufchmN1f+yqYpFIqP8qA50xnXf
         FeMi6ehYMZgFfC/R7W2CWcCeGgZ/7r8yeOxz+G8RWmd1zgJY9a/6Thv4KBe4bQwHiITy
         +9hmVDtkLIwIXttnoGguXAgFagIwrpfOi2kj6f3Bv0BkOwxRFaE3c3C0tXAeAIP57kBx
         nS1hhTzz4fmxhjhyzrwHVj6eRZ1GMcxupjzaeBW6iMIxGHnxlRKS/T47WTZkYFhCPxoL
         ZNTOlE+IgywElLSh8gJF7v1bO6g1gSgFUn90/jGdhgu3lYd4Fl/enwjyqrSphxw8lzqO
         qlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141534; x=1782746334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/6cLw2+muN50gac7bA2Xzn5QQf7rCJUO16TP8tP150=;
        b=OOeS013ss7eUnqK5vz0/raPsr7gi37sS5EkDNcazQ01xlmmwmw1aLLPkBJheWT8Oow
         VbXvOnnqKQHuUSVA7ZXxm86P2r1EzT9VZ4BADwS8qCSkYMF/uWZA8FcDwcPK5RIEEBa+
         mK0hr3v0spK6yaB5rb6GyrimEeHXiPQxID4HJd3sHz4MrqZODebrkTFyGl9eoluf4Vuo
         lhXzGb3U9PLqyG8+q0DscNpVxMV4Fc6j1xmT8IOIxP2gf75ePaICGlEoBwOX51el6dxw
         pTLJ4gedutDmecZBimZJ1JwsKKleGYhqiVQ1hb4+c7Y0fXGlJXnS6AYWM/Pv0CiHbBFW
         Idbw==
X-Forwarded-Encrypted: i=1; AFNElJ/qTyI8O3jrKbMqmh0fZQwYh32H7vQK8c7Ep/CKICmgtHdsJb92ZrCghaBO49VxDPzTDYDpmkUFi4LOtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp6REF0ve0kto0WnZblJizowMIAeWXCEe6vnraohe1W/lLZyE7
	GZAhQdYgf/ooNNeUYsyHYjDlI3BYLmQFcwGBmxkN8dSV/lKBlj8N4+3G
X-Gm-Gg: AfdE7cmlE/N2pYVV8rX/S1cKj6PV7i0bKES03x9ksr81Ci8TmRmZ7DVUcA1HJBFoDTE
	rUZDqT0imcBs07rrVQc2/TCYsDlBvN98FnYhHC0N1elnsqXusI4rHqXb4pI2RB6iErJtBITLMs5
	YY7qdCApTUsW3oywlSIO8CxwTg98tHJQ+yZMSUIR7DBdjqAoHqROGM34Xvb9p9LFMkvRvpOq7/p
	emPPRoUc63cNrohzwo2dRUGB2yHsOelp+2kJqBSOWfjRD9fd0eqFQctMaiVW/19dLr9sB85/MrT
	ixyEVkSOG4HOnYLN1/+Fktw6tkTQp0kdQFSdorNcoabay+scWoQALF0aiDL7HZ95+0aCQAGDGMq
	9aJGuoHmNa42bP+1OL5pwIYU8bOLxSbmkCwRFKX3YsoRq8GS7ejJ4fjunL8pv4eOvOJUKv4UHY2
	hHVy/p9vlfOH1kJmce
X-Received: by 2002:a05:622a:5c1b:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-519e4c27793mr220029711cf.30.1782141533547;
        Mon, 22 Jun 2026 08:18:53 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0989f0a8sm70034291cf.22.2026.06.22.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:18:52 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:18:51 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Message-ID: <ajlSW1NYc5qh1bL1@rdacayan>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
 <ai3tafRfEgN938cu@sirena.co.uk>
 <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
 <7f94caa0-48ba-46f3-922e-f16e39fd22c9@kernel.org>
 <357aee62-78ec-4ee3-afb8-5be3ffe70cbd@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <357aee62-78ec-4ee3-afb8-5be3ffe70cbd@ixit.cz>

On Sun, Jun 21, 2026 at 05:54:17PM +0200, David Heidelberg wrote:
> On 14/06/2026 23:40, Srinivas Kandagatla wrote:
> > On 6/14/26 8:26 AM, David Heidelberg wrote:
> > > On 14/06/2026 01:53, Mark Brown wrote:
> > > > On Sat, Jun 13, 2026 at 09:55:59PM +0200, David Heidelberg via B4
> > > > Relay wrote:
> > > > 
> > > > > Currently this worked only because the cs35l36
> > > > > codec mapped both DSP_A and DSP_B to the same hardware register value
> > > > > (asp_fmt = 0), which is inherently DSP_A timing.
> > > > 
> > > > > The CPU-side AFE is configured with qcom,tdm-data-delay = <1> which

No I don't think so, this devicetree property has no effect in
sound/soc/qcom/qdsp6/q6afe-dai.c.

For the Pixel 3a, it only mattered with the RT5514 codec.

> > > > > produces DSP_A framing.
> > > > > The codec format should match what is actually on the wire.
> > > > 
> > > > > So I'm pretty lost if I should go fixing cs35l36 or sdm845.c.
> > > > 
> > > > That sounds like both.  The Cirrus driver is definitely buggy if it's
> > > > mapping DSP A and B to the same register value, at least one of those is
> > > > wrong.
> > > 
> > > I need to clarify. The CS35L36 supports by default only DSP_A, but when
> > > extended to "take DSP_B", speaker just works.
> > > 
> > > This was done previously.
> > > 
> > > Since there isn't any different configuration on the codec side when
> > > added DSP_B into same codepath as DSP_A, I would assume QCOM ASoC send
> > > DSP_A, just marking it as DSP_B ?
> > 
> > 
> > 		qcom,tdm-sync-mode = <0>;
> > 		qcom,tdm-sync-src = <1>;
> > sets the short sync with 1 clk delay making it DSP_A.
> > 
> > for DSP_B you would need, no delay.
> 
> Sure, does that mean the sdm845.c is currently correctly setting
> SND_SOC_DAIFMT_DSP_B there? or there is some missing part of logic deciding
> it?
> 
> Because the reason audio works when I convince driver either:
> 
> a) sdm845 ASoC it uses BSP_A instead of B ... or
> b) cs35l36 it uses BSP_B instead of A
> 
> implies to me, that:
>  1. both devices are setting the HW to either BSP_A or BSP_B mode (just
> don't know which one)
>  2. but the driver flag for ASoC or codec we setting on the driver side is wrong
> 
> If one side really used BSP_A and other BSP_B, the audio should be at best
> heavily distorted, right?
> 
> Please correct me, if I misunderstood or if there is nice doc I could read about it.
> 
> Thanks
> David
> 
> P.S. I did quick search what close-to-mainline repo has for Pixel 3a to
> reach working audio and it's slightly different, see [1]. There isn't any
> change done to the cs35l36 driver in the sdm670 tree.

I just assumed DSP_A and DSP_B were codec-specific.

> [1] https://gitlab.com/sdm670-mainline/linux/-/commit/9eba5aa993f5fb7b4bf5cc936ec22852987d3f9f
