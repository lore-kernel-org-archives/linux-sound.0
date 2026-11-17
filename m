Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913203;
	b=mdXewbMcwsgxFpdyoU+x2ebDzzi28SB835YuXp/Wgx2jU2P7YFQBH0BkcTgxG/IgsWsH
	 4n/zoHSnR3fS5WnIlZq2A1GtjRrCqf9xs4q8QGg6zUaWgn2VEY7t5Fkm+XRUFHp6q6HH+
	 PBAafdyS0ls2CLq9r5oGsa6ouFSKdd5WEoca1rmhDabVuhWvtPfEMBDZzlH77l9AbqtLr
	 CrI8Ry5uY1BpbsV4kFpEbkzhpgy4P38kUmqUVtku3mkjia191A7bvgGNw5792Llchootc
	 9gNoLh7ZW4iDgvQo8vAUpVKnS85PbbBXSPEwQZ48WUFmp/4dcFoqsKI3fmVaM6RhUwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PdT8ZE88YJfKr/XAStKlIa6UtKYnZ1PbUIlLFpxm4oQ=;
	b=OWPNNc4P/12NEiVB8xSswnLGIkjREh4r2iYWuiImeAcU0HHyvbH3XLx43roRa6Vw1U7L
	 4qDLFtAFsqj5za9wM5aIJ4rwvKynOuj9p6DmL2g/2LQc05APoce0JNZ0WTf/8tc/L3UTC
	 A7k3IWvaHmQNx77NrvYWq/6aWjy1v5u4Ox7cafwQP5D3b6nOFjmPx8KD31aRrKqTC8FBO
	 5Ygl7K3Ka79uYO4oot1Ew8meZ9W4TriL9s6qi/7FRlxuStptl3+zigDNawcBthjgE5xQ/
	 9t13MMG5UCAFc9/KRJBO9UtiYs88EoTDdTvVHwf37chbRpkSapoK2KBgFnvdtBauS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUfSuOwF;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E46606A32A
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E46606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUfSuOwF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40312e2so3364057eec.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913202; x=1795518002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdT8ZE88YJfKr/XAStKlIa6UtKYnZ1PbUIlLFpxm4oQ=;
        b=UUfSuOwFzUSHdZPpJHoGq3eMtd8BK3Fn26oGLg82UdTlqkK/0SUNncE/I0ad8KX7eh
         MBzqfBmSdq3OovX7KHSulciPjJolwWpWf+38q1kDy02hH5+6SHi5HY/cn/4aE6Tmfs72
         2S1oyukidneUm22DCz60HjKG7tk/8JoehDifFJLpB56nbaT6Cd1T4x5uYC4N6OEGMN++
         rXQb80Q2YWH5dZXwEyKee3vLpdCgPnHXFo9i9C4snnfSnp/83rkOq8er+ATsJME4Pmv1
         9wOFXac+xLD65kCut1IBSRP7VhIOVICezOarBGyt1s7Ps8Y1MIm9w4faUHPVreJId5ze
         i15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913202; x=1795518002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdT8ZE88YJfKr/XAStKlIa6UtKYnZ1PbUIlLFpxm4oQ=;
        b=i50NFGJPYnWIrU7bZXfWfy9YLoH990tUmNKKRdPOlqQKP/KL5euvF2Vru5HuPa4p/b
         BFA93hM2GSMmieAilprWGm0qp03qjwCBTWRE/BsaXVOWomRIkh9PRxAVvw6YTO+aw1KF
         oVEB3C+XbBIduRNembykEHcScvQAoe7u18QF+FsroCy97R4PTrNYbU8gzxnyOeyRidi8
         apKqkLfmGKAZEcR76euZ8gXcklOvC6pvPD3qB2JgDs9HQUxCJQj2SDt9ZWWhm5wQBayP
         Xjyyjrf/425TYIj+YFCqAyRpHio4kMHvwb/506KBIXSskWbnR1UppY4mBExyD4Bz/mBr
         MoeQ==
X-Forwarded-Encrypted: i=1; AL+hErFzOJqOMk8y9RYCOyB11OGmb1vsMgzgMVt3Wv0G1qTr1IdUI7fPl8XpYXmvOfnkMLMrbuHbxf350GO00g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mpSEgrFr6i+bNSS9Hf5cFTIP2TrjOZaVe2dpjjolrIso76feo
	syWXx8SS0gXpHbUzkoQI5gR7TV8rrnLSsibCO5MbUdezW8EJ8x+b/9Jx
X-Gm-Gg: AZFdTZeRtzCajEBA+WDRl2ABtQVdiXPOsYBIaMWhGJZdDkPXej2NaVZbq/D7qxqSFNX
	f2MfQz81mgzGQdr784Jje5Kz+YxaZWzcYLReeR4QrZBu/N6sMGU8r/lZuzkS5xpLVLrFAg/OwJR
	Ysf0F6+FXAwrw+GwvSuuA5B1zLkgu67iegtAdxUtTjY6tLb3xG+VpBmfSOctX0Jae/wALKeYrM8
	41rEHDHH+eGEehRNCpND4PZTgSeY/cIEHS5IWvpPAB5at/+A8F+Apq5TfaslumYc7Q7tJL8csxr
	3FxGF7GcX48QRQo4d53BgHyJRzRs4xT0/ATlMc6LcC/L/AKJjBvc5wy0F3YSeeFwtBSGs+yBkJw
	rsDuyLXlw1GZ0AQPqtElSDTSGCSZb83r3vSdkdity6yIevKqLndcDG5KO1dlR8PkVaZQ1mzVCgS
	E1qAnpCDDQYyAlW3QoV8aqblqO6hX4ERJVJO+WhUvyJH/5fvjKO0pEx1LoJxWJKfRUwk6fEA7dA
	m0vU80Cd8FlsKuMQPa57SJYbe+ym0As7vu9vSCrCfn6/OOxAwVpWFH35G+UtBHmihjnnK80xsn8
	99b14mOSjCu8wM0ttuRmCXPru2Dty1AwKlCf3SDb8NiasIeSf1i6YyN9mRF/Dl2gcgPxUk2RL0H
	pYvIYl32xXyf/kWPDZTDwHPF6Q3415GFff83qXzpLT2QryM5DbTgqBrDkI9QBLxP/ZgV9KjhsFn
	cw2Kb7dNSz9LBIGEIrVxzcGAMQ+UBZZ8W5sxFAHEWTEQ==
X-Received: by 2002:a05:7300:e9c8:20b0:379:8c67:9b47 with SMTP id 5a478bee46e88-3798c679e38mr15032808eec.7.1794913202189;
        Tue, 17 Nov 2026 03:00:02 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.02.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:01 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 0/4] ASoC: SOF: control: fix volume, switch and enum value handling
Date: Tue, 17 Nov 2026 16:29:46 +0530
Message-ID: <20261117105953.188645-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALSA mixer-test selftest fails on the SOF controls of a Lenovo V14
G2 ITL (Tiger Lake, sof-hda-generic-2ch.tplg). The HDA codec controls on
the same card pass. These patches fix what it found, plus one case it
doesn't catch:

1: a negative volume sets the control to its maximum, because
   mixer_to_ipc() takes an unsigned int and clamps.
2: a switch accepts and stores values other than 0 and 1.
3: writing back the volume that was just read generates a change
   event, because put() compares linear gains while get() reports
   table steps, and the 0 dB default is not a table entry.
4: an enum accepts item indexes past its last item (IPC4 topology
   only has one, "Dmic0 Capture TDFB angle set enum").

Patches 1, 2 and 4 are in the IPC-independent control.c; patch 3
touches the IPC3 and IPC4 volume_put() ops.

Tested on that laptop (7.0.14 kernel, snd-sof rebuilt with these
patches) with mixer-test:
- IPC3 (sof-tgl.ri, sof-hda-generic-2ch.tplg):
  287 pass / 8 fail before, 295 pass / 0 fail after
- IPC4 (sof-ipc4/tgl, sof-ipc4-tplg/sof-hda-generic-2ch.tplg):
  287 pass / 12 fail before, 296 pass / 3 fail after
The three remaining IPC4 failures are control names in the topology
(boolean controls named "... switch" instead of "... Switch").

I also wrote out-of-range values to every control with plain alsa-lib
calls (amixer clamps them before they reach the kernel). Before the
series every SOF volume and switch accepted them with IPC3; after it
every SOF volume, switch and enum rejects them with -EINVAL, with both
IPC3 and IPC4. pcm-test results are the same with and without the
patches.

Arnav Kapoor (4):
  ASoC: SOF: control: reject out-of-range volume values
  ASoC: SOF: control: reject invalid switch values
  ASoC: SOF: report volume changes in mixer steps
  ASoC: SOF: control: reject out-of-range enum values

 sound/soc/sof/control.c      | 26 ++++++++++++++++++++++++++
 sound/soc/sof/ipc3-control.c |  4 +++-
 sound/soc/sof/ipc4-control.c |  4 +++-
 3 files changed, 32 insertions(+), 2 deletions(-)


base-commit: 7cd6b1fd8f9c1fcb1da1b761d502649f50b9800f
-- 
2.53.0

