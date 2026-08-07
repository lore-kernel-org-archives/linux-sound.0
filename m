Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060644B04AF
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 05:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080123; cv=none; b=X/E890CA3GAjPIfh4uiqqzUK9Fk+Yz+JiiLy4gSYR5EmtLh6aulVdgpFGjM7pLF4eJUuSu2aWf/Mkfb7PwpPfB72ByFnuSvpN/DZlfN7gnnvDMzTwNJjf0xZfXAxJ8ml6GEPbWzmoubsg3XAuR8WJFinmKH0e+kSquL8Vo/Vnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080123; c=relaxed/simple;
	bh=HSsBXFdUlIkuLwDWXwFFmBArCNAuG0DA46z3FbZjrlw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sbxvFy62JmkLtIhPh5pnJ0796noFKBffGqfj/Th/Zb2aSPtwnUuZ36c6fRZP+etpMx5Og7kkdhzeiiLmdmfVjyWq7qCNNNtswNCPq6rwRxQrBSgRCjrACRnqHBouKHoyTO9ABZv0CmNcqBx4fzVrAk+VxksAM2FHSfSMcBxCpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6/wgH4Z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6/wgH4Z"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0117dda13so2515850e87.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786080118; x=1786684918; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzF2xPvcNfQpLHHlELzmZnypVmdloPb8Ky9A6X90We0=;
        b=R6/wgH4Z5uegvMtzpKH/P6o3+CRUMKD91Agu6j7qkl180C6mzq4GczBkHvatkdrKcJ
         OPFaUP7lpqW3csLDkHGZLvm0HUGd01UeiNEjeqaW80WBVLgmBj8KDgbd6v2rNJYGszOM
         zJZZRMJGS8cRnkx3mb3n1iEXl0wfW2ZPem+93r3KF0ItPaTTHu8CTC4WyAzEnNJqv2mx
         VKRA3E7PjnAVYYi+D6fCpWVWASJ8o6brxcmu/9M+OscUvsPuPXFfvlBiCJLBzk4ZWiS6
         qMeeOh5k0npPFqOe5z9nwEO056/dqJrWSDfgw+wuXwlW6EpiFsqOzE+uVKvVmc2nhFTY
         pqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786080118; x=1786684918;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzF2xPvcNfQpLHHlELzmZnypVmdloPb8Ky9A6X90We0=;
        b=NNG/vJSIoFaP7p76E4kfrorFDW6Zu5ocw2k6cj6DABgN5aagcj96LhpB6oV44tyVUE
         z3kUP4kNeBT7Fi9UtHsXX5RqDCL99fbJYT5lDmXKmnjr0eYaTztl7JSm+OyHPMT4gQ6x
         So31Jj+RLacCq5IP9T026FVJdmfBMH9gIQuiSYpMPEi9cCFBD3PFEyzKXyhLnShahjc1
         bx8femWL31bSNpCRirb1Azg0+Qc0820mFy1pyL98hrV90lfmtF//U1HtfAdVZfaAZZIM
         e7cnUlXquYd2kWGsLCNSM2EKAlwnnZTtTAVO/1QRIafOEgL/Rj5JqsRGUn55XHotiQ/K
         Vb2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rowrfsh7tTlFQykLzEy7UTvjLWScW5gFkRwTAQNmL/jbkKJY/rKk02S0FVqOEQ/XvTxXdTLnsw+w0+C6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIacX/2vCRHK+VBx8oIAfxYM6AvohsWBv5TmO82g3TX1x0Lzpd
	lv40K7NfjKLOpGN4tlamdKM9q5ahcgfzY9TK2tCq9zp75JwswEuDWOSv
X-Gm-Gg: AR+sD10xQ1RMqly2AMEWZRFe8eWyWkOcUMvKHCIKwRD41tZQ2HhveMywNCDrtHEFSFp
	RoC2ni6iAzd2gPoVzs3Pro5kChjFIEbDhnqO2c0b3eVJWYNUQfx4k5mFatAiXK8E29gTGtJ5f2y
	HdJzC4r6G8oxO07BQS3vBCbnedsZ6/0PfBhbppFlgk9XFigc4ewo3Xbpp+IMgkv5o9JWpcEsuR6
	X627veCKUyEXRuTT/3TmLlCFrjP59wnVKmz6W+PsAdODw00HIUq6d3JLX4PrYITpXvKzg4FjtfJ
	SowgaFbtBxNZY80bilO5oakDvNwpmkPGYLdpbgO3WkUjvF+qvazzAZ9qVwCu0QQeir+Olv1IwPk
	fgu2vwKF25QPHbZY5jnUBPUrJwGfqdKXk2hGyZ4o6REaKCSzDleHK5DlqbKs1Dhn14752v0NUlO
	up7SEYi/czCYB+nnd+MrJjsbl4DAlrxPVkQ9koyVj0DeLV4Va0ogM6CioM9C89gYY2s2HiGMS4O
	iC7f/0pf6tILapmD86X9p71DYdpRmBJ5Q==
X-Received: by 2002:a05:6512:1291:b0:5ae:b78c:da1 with SMTP id 2adb3069b0e04-5b2f4cc9220mr2797658e87.28.1786080117504;
        Thu, 06 Aug 2026 22:21:57 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055dee58sm265223e87.46.2026.08.06.22.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:21:57 -0700 (PDT)
Date: Fri, 07 Aug 2026 08:21:56 +0300
Message-ID: <ef0cc45a88cf0b5b5a65f7634b710a42@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Antoine Monnet <antoine@montane.tech>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ASoC: tas2783-sdw: port prepare never completes after S0i3, no
 audio and no error (AMD ACP7.0, ASUS ProArt PX13)
In-Reply-To: <b863334f983a42888d0de5973a998020@ti.com>
References: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
 <c6b9b217-3678-42d8-8e01-7fdbf7c67c7a@linux.dev>
 <b863334f983a42888d0de5973a998020@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Niranjan, Pierre-Louis,

thanks to both - answers and new data inline.

Pierre-Louis wrote:
> Just to be clear: are you referring to a scenario where audio playback
> is on-going, the device does a system suspend during the audio playback
> due to a user request, and on resume audio is supposed to restart
> playing?

Not necessarily on-going playback - that's the point that makes this
hit ordinary users. PipeWire keeps the PCM substream open the whole
session, so the substream survives the suspend regardless of whether
anything was audibly playing. After resume, even a stream started
*fresh* by an application plays into that surviving substream and is
silent. The only way to get sound back is to force the substream
through hw_free + hw_params (I cycle the card profile, which PipeWire
translates into exactly that).

So the reproduction is deterministic and needs no aplay-in-background
race: boot, let PipeWire open the device, systemctl suspend for
>= 1 min (enough for amd_pmc to report real S0i3 residency; without
residency the bug does not reproduce), resume, start any playback.
Silent every time here.

> It could be that the use of the port_prep callback is restricted to the
> initial stream setup. I am not sure if that stream callback is invoked a
> second time after a suspend-resume cycle

I can answer that with a trace rather than a guess, with one caveat:
stock ps-sdw-dma.c advertises SNDRV_PCM_INFO_RESUME, so a plain resume
takes TRIGGER_RESUME and skips the prepare path entirely - no stream
callbacks at all. With a local patch dropping INFO_RESUME (so userspace
does a full snd_pcm_prepare recovery), the resume-spanning ftrace shows
the complete sequence running after resume: sdw_prepare_stream ->
sdw_prep_deprep_slave_ports -> tas_port_prep() invoked again, 4 calls
(2 amps x 2 callbacks), DPn_PrepareCtrl written with the right masks,
then enable. So the callback *is* invoked on the recovery path - and
the amps are still silent.

The one thing that separates every silent case from every working case
in my traces is the de-prepare: the working path (hw_free) writes
DPn_PrepareCtrl = 0 first, then a fresh prepare writes 3. The silent
path re-writes 3 over 3. After the device has lost power and been
re-initialized (SW_RESET + firmware re-download on re-attach), a
rewrite of the same value evidently does not re-arm anything; the
0 -> 3 edge does.

Niranjan wrote:
> The device expects the DPn_PrepareCtrl bits to be set to be functional -
> but doesn't update DPn_PrepareStatus.

Thanks, that explains the design - I'll withdraw the "port prepare
never completes" framing then, since it leaned on reading
DPn_PrepareStatus, and per your description those bits are not to be
interpreted in Simplified_CP_SM.

One empirical note, for what it's worth: on this hardware 0x104 is not
static. Across all my dumps, on both amplifiers, it reads 0x3 in every
silent state and 0x0 in every working state, tracking the audible state
exactly. I'm not suggesting polling it - just that on this part the
register does reflect something about the port state.

Which leaves the practical question for TI:

  After the amplifier loses power while the manager is power-gated
  (attach as UNINITIALIZED, SW_RESET, firmware re-download), what does
  the device need before a port prepare takes effect again? Empirically
  writing DPn_PrepareCtrl = 0 and then 3 works, while writing 3 alone
  does not. If the 0 -> 3 sequence is genuinely required, where should
  it live - tas_port_prep() unconditionally de-preparing before
  preparing, or the codec driver de-preparing its ports as part of the
  re-attach re-init?

If TI can confirm the required sequence I'm happy to write and test the
patch on this hardware - I already have the register dumps and traces
automated.

Thanks,
Andrey
