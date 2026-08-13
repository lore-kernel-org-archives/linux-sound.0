Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C290495530
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638756; cv=none; b=X0l+3RrzuQOKLvmCEYQC1raR/mH5SK1b+o+yb4xiYLgjf61auLmMR+rQnFcvNW0m+DnTWHkXpsQX74iZ/VGPddZRa4CaFdRf4XnKrVKD1BZJ4W8cU24e2j3Fdfjr0YcVjYa7Xu8ukoOeiD8gLn4Vi6zLte4yuTrJzIi/pfSXij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638756; c=relaxed/simple;
	bh=yZsayIIRWkvLHibdEjd2G21zSgUhMa0Xp79RehKKOIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZN3SYztaaggK6HJnzQOqm52lPQw2G/gLHtt4klzP+FGjgjY61kNcMymRhbZPHMBZRQv1iHCifAB7ep8AVy8I8/3qR4W+n1T2GUbVBmFPxsi0bvf/vGJPlnTkdST1GA1VDUekV9ZBIzh0jjx0vRa3tHeJY4iTUAEJUVM6i4eCya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T06hmwl5; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T06hmwl5"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1313232e87.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638751; x=1787243551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BUYf9Zsf2WSHXbVUW7L/pdubtMVZe2GVng4+E2hHXS4=;
        b=T06hmwl5Bu2thEL2vt9Rm7T5JVg/YY4369X+ZUIRMo61BqHqIuJoFuRd3dKcZirbR/
         FrmfvI3pFjjweWOTFo3ov/yjlaGKKHhu4pivflIPQgvVKWn3M9RN4r/UYGzJaG/ThNBv
         rZrLVY15J32oKXGehIXkGNmK286Tnj0Tnz2XhWJwWjswFmAmBSCau0uAAc/ci7NZf/FS
         yt0dv9llSejp3E8NvUxEHd04KQkdciIVGbg2YN5fCKHhPXM7TsxGkZlq/u9Q8xoHkWs7
         HIG9wO2WbgxXn1l9OqcUtUgofk3xIZyDlajlAMZGvprtAk65IifU56ZK5CMW6H7f+K2n
         eovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638751; x=1787243551;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUYf9Zsf2WSHXbVUW7L/pdubtMVZe2GVng4+E2hHXS4=;
        b=eUwc1TMIv+zf2JWVZj3aXa9hP29fIo1Dys3cGE73QSV1xkafqnmMNFTCopHMpGwR8X
         vlJMB/Lw/dlONtgEWkjrMTFufy5ICKi9KwtaGvafaFgyfPUwqOyoJhjX9rUaaV+kdsUm
         wTovukEpWfn7LTdIo4g70TdFn4bKiP50jyR2MdCgRDNr3mqac3vhib/mA8RT8ERKTE+z
         9PP3NBQuWLO0M/B/G/G+qSaw2Yt02ocxUUPuC7pEBhKQel66AOLJgM0jCQeImbivy69z
         4bMl4mWCTHK6VM+mvMSjwsA28ATmT/VzE45nJomIetdeR7SIjQiuzm1bhY+9YXCY7Bjz
         HeIQ==
X-Forwarded-Encrypted: i=1; AHgh+RorOwPKUqvSywVcPh1gRuFFF0wWfUq9/lY6pMcNIcciKas8Ca/w+Kv1BbmxESXSmKen6pW4/Kxowt2gqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgtnUC0w/Ena4cF6fBTW9Lji1YkrWxqyamWOxbeAFHfNLMuag0
	21hvSf2DGrJSUTodx/pvbolc6FRPTksRIuidcPuYazn7ACJJPiQac/qhou2q1iznyrHHtg==
X-Gm-Gg: AR+sD11/P4ToscLvW41uwNBrDpWaxg7pxnWbjrn/Xw//gh1uiohuKCOeyAGw4U78uT6
	2lATcfC/Ad1DhkqgFxqcyvcq99OQ7oUV+vw2ES7oTyQ3lUtUGj0hIIvHve9+Rm06wMH0f7ZCTFZ
	CefxaJDmr2RBDZFwChM4MGgtrfvtPbM5kQIcyiBnFC6f4yq7eez+LY29uaqAtQdryob2UKuhVZR
	Ta8DYayxohd5r8IEcRtMZuWF/TtRdCnoYrfFETndtocL2EBlUe2k4i8OJ7CCAWhMQEssNA/Wnpr
	PkM18sfi3ShRylSU7qFmybHhrZcDBWJRGOVOTT/qrTWRuvFtD37Xa8RQFoHrLykRb+0PEMnLH/C
	zMYe/sI/eDY1MwZ76b5ZDL7xyQrNl4oAVLzxI6BgG/NjSXT6P1ldm1uz/Gu4NajUJcLKEnp1gUU
	tHWXXNAAIhF6P1GgaugWUASm5iUfzzz0oGPiCQF2Uyd2OcoKqiK0Ej+8Xhvt+RZqYSDwkQsFXLF
	LKeTLDwVoJzpO5LbXr6lX8=
X-Received: by 2002:a05:6512:428a:b0:5b4:473f:847b with SMTP id 2adb3069b0e04-5b453f836d2mr1027163e87.39.1786638750711;
        Thu, 13 Aug 2026 09:32:30 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a986sm1401e87.14.2026.08.13.09.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:32:29 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Robin Everaars <robineveraars@pm.me>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing the port
Date: Thu, 13 Aug 2026 19:45:00 +0300
Message-ID: <20260813194500.10598-1-andrey.golovko@gmail.com>
In-Reply-To: <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk>
References: <20260813001500.9218-1-andrey.golovko@gmail.com>
 <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Aug 13, 2026 at 02:22:52PM +0100, Mark Brown wrote:

> Does this DTRT if userspace restartss the stream by directly calling
> SNDRV_PCM_IOCTL_RESUME (AMD adverise SNDR_PCM_INFO_RESUME...)?

No, it does not.  I wrote a test that takes that path deliberately - it
plays a 440/660 Hz tone straight to the hw device and, when the write
returns -ESTRPIPE, calls snd_pcm_resume() and never snd_pcm_prepare() -
and on this machine, with v1 applied:

                       before suspend     after snd_pcm_resume()
  DP1 PrepareCtrl      0x1 / 0x2          0x0 / 0x0
  PDE23 req / act      0x0 / 0x0          0x3 / 0x3
  tone 440 / 660 Hz    +65.5 / +75.2 dB   -1.7 / +1.8 dB

(two amplifiers on the link, tone measured through the internal
microphone against the noise floor of the same run).  snd_pcm_resume()
returned 0, the PCM stayed RUNNING and nothing logged an error; the
ports were simply never prepared again, so the callback v1 hooks was
never reached.  asoc_sdw_trigger() only calls sdw_enable_stream() on
SNDRV_PCM_TRIGGER_RESUME, and the channels are then enabled on ports
that no longer exist as far as the peripheral is concerned.

v2 preparing the stream on that trigger fixes it:

                       before suspend     after snd_pcm_resume()
  DP1 PrepareCtrl      0x1 / 0x2          0x1 / 0x2
  PDE23 req / act      0x0 / 0x0          0x0 / 0x0
  tone 440 / 660 Hz    +73.7 / +88.3 dB   +73.7 / +88.5 dB

It is on the list as

  [PATCH v2 0/2] ASoC: tas2783: prepare the port again on the resume path
  Message-ID: <20260813194000.10412-1-andrey.golovko@gmail.com>

> Similarly we can suspend while prepared.

That one I could not close, and I do not think it can be closed from
either the machine driver or the codec.  A stream suspended while merely
PREPARED gets no trigger at all: snd_pcm_do_suspend() returns early when
the stream is not running, and snd_pcm_do_resume() returns early unless
the suspended state was RUNNING or DRAINING.  Userspace calls
snd_pcm_start(), the ports are enabled, and nothing in the path knows
the peripheral came back empty.  sdw_prepare_stream() cannot help
either: the SoundWire stream is still SDW_STREAM_PREPARED, which it
treats as "nothing to do" by design.

What does know is the bus - the peripheral goes UNATTACHED and comes
back uninitialized.  Invalidating the prepared state of the streams that
peripheral takes part in looks like the right place to me.  That is a
core change; tell me if you want it as part of this series and I will
write it.

Vijendar, thanks - that matches what the measurement says, and v2 takes
the first of the two options you named.

Robin, your negative result for v1 earlier today is consistent with all
of this: playback opening cleanly, both amplifiers attached and silent
is exactly what this path looks like from userspace.  Two things worth
checking on your side before you spend another cycle:

  - whether your player recovers with snd_pcm_resume() rather than
    snd_pcm_prepare().  If it does, v1 alone could never have worked for
    you, and v2 is the patch to test;
  - v7.1.7 predates b627da430357 ("ASoC: tas2783-sdw: drop stale
    regcache on uninitialized re-attach"), which is in for-7.3.  Without
    it the register writes made on resume can be dropped by the cache,
    which is a second reason a v7.1.7 test says less than a for-next
    one.

I would take you up on the offer of registers around a failed playback,
but on a for-next kernel with v2 applied.  The register readout above
comes from a small out-of-tree module that reads DPn_PrepareCtrl,
DPn_PrepareStatus, ChannelEn and PDE23 over the bus without touching the
regmap cache; I am happy to send it to you off-list if that helps.

Thanks,
Andrey
