Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43947986F
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638745; cv=none; b=i1wBP/X8drp7KX2CdVFyP+WFSsX1m0Gd7UUty8E7rXtOB6iGz0oPIqA7a3Gamdqt0R5gQUa2mPcVMXWfUcwHOpL69X5jmqoHWxPzFDLApfg4j13XHRLdGuaUbMXLbF/+OwWQakEezptp2oHmZmwVdAUGx8JqRHNpyULREh7LV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638745; c=relaxed/simple;
	bh=HZicmxUUOpS6CGWEuqkm1tl3YvK+raB7ORnOjAMDlCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h0Y92uMhA5s5rFVtB7rlT57suOYdW0fusE/psbb9nIup+tQ5I2NWzh9WCk9fYNanHhGPPvsiLCuGI6DbwU3y9TuH8QeP5nLwnGs2vIrV0NxSiRJTq6zTHp0F4CsYLAm1RSjO1ykTMkiQJbikQ0E1kRZVibAhxRgS8hjK5J//tjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+Fp2oeI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+Fp2oeI"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39db07589caso103711fa.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638741; x=1787243541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHpua1+/T2jwXiMFwjfaahjFmIYCFSCOXa/uI/tolDE=;
        b=h+Fp2oeId5FqZ/4Fym62ABH6VLg2L1Vn4uA3B2MzYo6QYfsmEy8U78Qha/yChgKndj
         hPuqIswnkxv0G8uTLPwmfa8o3AyLinQloDd36M5n9BYAd2Mpm0ckzPyYo+FJsrgcd+7u
         qA7tzdYiBXOeqJl/foHpOr2XB2RYYaF4fiFBskyC76j83v7J3ZGUfP4Du41g/CplLyBq
         DDCRCZ+K9GZdndJieeDYDdSo0l4DcpRs1VfQbKlpVL/9YJ1+jHu/9v/I3sZzvSwEjsJw
         laSGq5RhmjuTYf0sunlsEKnW/uCUwtx4EE5wEzBAcJWlHsgwBvM+X1DKxC5J5Wa3R+Ra
         /rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638741; x=1787243541;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHpua1+/T2jwXiMFwjfaahjFmIYCFSCOXa/uI/tolDE=;
        b=DKi7vBOm/ySMxwMw/OmT3Hy9efdX3GCYP1r7Zo6vMwXPPKAoNMM374jmFlcdrjEdES
         CmVwfgIfhCF0Yz8AhFgn156LhekOZ//kctvO2dHC5F9FqTztSNaAavLykKI5F9wpuSHv
         klBa+bV6M2GFR73JIoh7c0tSd/VVjQRaSc238rG4bQv18zTJ6BgPE6BeX/VIst492IcS
         3O8xQr1cSxakJg88FkpxKaBWrdgQ3lw4JYhpvJC3x84w2hRT2OhEEOd4+ckaq9CZqkz4
         8hIeaF+3TE65D8mn3wmm9We04wGH/Qb2z/2oX8NCwPxs1S+X92U5yAaZcvOoCM+DEc3y
         vsxw==
X-Forwarded-Encrypted: i=1; AHgh+RrS8CB99BtVpxNbFRgRAgUDy0Sme1/EDNcrTutTNkNz9VFRLZpi95fPY0TUyOyB8QmmTmY6ZcFHnB/x/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxnCFaqv/mRXXWrwM9zcNZ8wIVL23FYNydZZbWJk4pEQ0QkSr
	Lp4xy4zKJ7vjXsda4JsD0PirDsY+VHvmvv7aPkhDA03dqEPcMkZya4WL
X-Gm-Gg: AR+sD13qGVYnR/JCgrAj3jEIU70IPBTjyKHyRm/BbN+v26uWDnyKBS/8tlE+9Sop7zq
	FxT5YValsacKPnXuc91WzAzwRtGIPWc52jnfkrEaGHYruNKuYDYT7n9vSHAlV9U0zFrqWdtXF/x
	vex/04Xv15qTHO/7/Q3s+N7nblySDiNfqkNpej2IaZFfYNzxdVhdk4yLEgZ7354yCs+3xRHdktd
	HgbJw+bO27VHjWqxY3yJ42uyiRGloG1GrQ4/CXDoxyXvLs13Dbu3o8ob+TetN/kwt6VJrdlTnyK
	sc816UjcLjEvmo96Y/SsOIkLBUylLj+ZtS16P26r81Umfn1S9s9QJvtTKn2FVJy6C9hllxUsbFp
	HLDT9eW5Vfecj56Q9F1uhRMfKEtQBPLcpCKUsXgoUnrFUzvJ6ddQTcIEtKa4GSBcF7RqFWWgXO2
	ks6ZmfBK19utrpt++fchX05wVQtfHtoKltNvAfW6sCJRBpJP2sxqNY1zf1G8o5+XguvAalTYUFI
	Wda4PEMYKYCUhbGBDoKt40=
X-Received: by 2002:a05:651c:b21:b0:39c:9dbf:f7b3 with SMTP id 38308e7fff4ca-3a11a071fdemr9406901fa.0.1786638740515;
        Thu, 13 Aug 2026 09:32:20 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cd8e3asm506911fa.25.2026.08.13.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:32:19 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tas2783: prepare the port again on the resume path
Date: Thu, 13 Aug 2026 19:40:00 +0300
Message-ID: <20260813194000.10412-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 was a single patch that powered the SDCA Function up in the port
PRE_PREP callback:

  https://lore.kernel.org/all/20260813001500.9218-1-andrey.golovko@gmail.com/

Mark asked whether that does the right thing when userspace restarts the
stream with SNDRV_PCM_IOCTL_RESUME instead of preparing it, and pointed
out that a stream can also be suspended while prepared; Vijendar agreed.

The answer to the first question is no, and it is reproducible on this
machine, so v2 adds a patch to fix that path.  The second case turns out
to be a wider gap that neither patch closes; it is described at the end.

Measured on an ASUS ProArt PX13 HN7306EAC (AMD ACP7.0, two TAS2783 on
SDW1).  A test program plays a 440/660 Hz tone straight to the hw
device, the machine goes through an s2idle cycle, and on -ESTRPIPE the
program calls snd_pcm_resume() only - never snd_pcm_prepare().  The tone
is measured through the internal microphone against the noise floor of
the same run, and the peripheral registers are read out of band.

With v1 alone (broonie/sound for-next + v1):

                       before suspend     after snd_pcm_resume()
  DP1 PrepareCtrl      0x1 / 0x2          0x0 / 0x0
  PDE23 req / act      0x0 / 0x0          0x3 / 0x3
  tone 440 / 660 Hz    +65.5 / +75.2 dB   -1.7 / +1.8 dB

snd_pcm_resume() returned 0 and the PCM stayed RUNNING, so nothing in
the stack reported a failure - the speakers were simply silent.  The
ports were never prepared again, so the PRE_PREP callback v1 relies on
was never reached.

With this series:

                       before suspend     after snd_pcm_resume()
  DP1 PrepareCtrl      0x1 / 0x2          0x1 / 0x2
  PDE23 req / act      0x0 / 0x0          0x0 / 0x0
  tone 440 / 660 Hz    +73.7 / +88.3 dB   +73.7 / +88.5 dB

ChannelEn also moved to the other bank across the cycle, as it should
when the ports are prepared afresh.

The ordinary path is unaffected.  The same test recovering with
snd_pcm_prepare() instead of snd_pcm_resume(), on the same build, gives
+79.8 / +86.9 dB after the cycle with the ports prepared and the bank
switched back.

This also explains the negative test Robin Everaars reported for v1 on
the same board earlier today: playback opened without an error, both
amplifiers stayed attached, and the speakers were silent - which is what
this path looks like from userspace.

The case this series does not cover
===================================

A stream that is suspended while merely PREPARED never sees a trigger at
all: snd_pcm_do_suspend() returns early when the stream is not running,
and snd_pcm_do_resume() returns early unless the suspended state was
RUNNING or DRAINING.  Userspace then calls snd_pcm_start(), the ports
are enabled, and the peripheral has lost its port state without anything
in the path noticing.  Patch 1 cannot help there - the SoundWire stream
is still SDW_STREAM_PREPARED, so sdw_prepare_stream() is a no-op by
design - and neither can the codec, which has no way to tell the core
that its ports went away.

The bus does know: the peripheral goes UNATTACHED and comes back
uninitialized.  Making that invalidate the prepared state of the streams
it takes part in looks like the right place to me, but it is a core
change and I have not written it.  Say if it belongs in this series.

Changes in v2:
  - new patch 1: prepare the stream on SNDRV_PCM_TRIGGER_RESUME, so that
    the ports are reprogrammed on the IOCTL_RESUME path too (Mark Brown,
    Vijendar Mukunda)
  - patch 2: unchanged except for a comment that no longer implies
    userspace prepare is the only way in

Andrey Golovko (2):
  ASoC: sdw_utils: prepare the stream again when resuming
  ASoC: tas2783-sdw: power the Function up before preparing the port

 sound/soc/codecs/tas2783-sdw.c      | 20 ++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c | 17 ++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

--
2.53.0

