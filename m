Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8523394D
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486078; cv=none; b=u57IbC1Lc+k5D9ZvIKymvjrd2P031n2/GQfy8wD0klHRe2vFBe1I2sxBWOT7ZZtMpb/EQkKa2t47bj8CpTWh2iNLvQLah26IGaFWP8WUad9fp5XYXflLnoPFPZnG6czbIxUCm2ui7/ErMm9zUQoOj0Eb747n8eprXkOQ1m+/1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486078; c=relaxed/simple;
	bh=2ENKqBaTPDdQhMdT3t9NB4MtzLMzeAWRcMV4ixhE+9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DkJJY0z2GqgAW+P9txnP1qI7ew1MHHjbERlzOwon5TNdGogaX1SrW+X6bEI8tD6y0xXZjyffO6G3mRvdY0dnhrO/fygysE9n2aOlPMiB9FKZCQMp9SPo7c3ODaiNlHsfmO4MBWW5c6chMGej0UOd1AdCDWM7x/EMlFcU4+FKoxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=MBcEWciw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="MBcEWciw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so2052478eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486076; x=1792090876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FggUo6U2laVtXWdbUW1VXActXrfV6jQYFCULV8ijL9s=;
        b=MBcEWciwLi1bYaNc9DFKUuNiSI53IjnLwgJCZhLQJiU/6yWp0TAhykhrCavg1MLjj6
         xs2GQJ4I8t06iPv1pDScxfPYVMll87LDmRvrO+/y5Hz7uPUozpZdadgLAPHvB/INvwV4
         0oweqVEyizdb8AYqdXoIlIX4BkS84zpQt+lYr8X+bJ2K8F2JEZMORSdXtPzx0QFSDdaW
         2z+E61Yr8RQ6HpL8Ufik9o6DCJq5YMgrK8ydrxJ7hkUCAu/I0dkU4G0TjjzeFrWPEPnr
         7v2Ad1TnAUs7AwVOZmAbkuJq56A/jKNKOJuyM9GKPwHLSLL5z2a5lNIvAZqScau5psRM
         rkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486076; x=1792090876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FggUo6U2laVtXWdbUW1VXActXrfV6jQYFCULV8ijL9s=;
        b=P8G/mQX40vpVKJlA7SG1BqGS7biBoLVCuKvWS8YeUglrPdegc6yIpCEPPja75A9GT+
         CJjg4eNyOjasIlCjT4J019nOLwjTSB5b7v+p2O+CT7f6878pYHOSGg+ObjCyqwvdRR3L
         TJfNKRFk+UyV2Zp3LbSvbQG+ekEchwIHGK8h7gRKYq0DFQ/dOUVaCtZFb5nhcLKK2DWr
         Y/txZiP+uq0Yo7imu/w7MDNULITdAPVRW6DL05eVKQuHSbImYwBD0TkxWzt9QQUYkOLx
         gA0TIqupUbhG7i9frJj6y/zM7mthTCng93PhmSQCRWxwU7TkXSemxYsY4Hgy45iIfJQP
         3veA==
X-Forwarded-Encrypted: i=1; AKwUvBwXzgXOc6xXFvKV7h9Z7BI2dOwxG+Ul5gj+3VeeTtHQ1CfQIUY/B/fV/XBApbCiIQcbCmXUdswMfCy/pw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLXnmUko4CblbHQCv9m9Ja77la+prV186bINrQeTslJgbtjUdOV
	+Rrn3GLZVhUKDCBPHerER/dafXrrJ0ttuLTcqGDDcVR0Qz1H90ChUnLJaMOWfafSbnw=
X-Gm-Gg: AYBFou1cpUA2/JblZsd6hfZG37ozQ8bewRuxPSP/ruq75rfKbW8Uh2J/s3ca20G8lG5
	uBoUH5vMpLq8JJfNiepdg4Nx3q119S2tcGCiGCSOaTGShQEoj8vSUnPgvXE6wBPMirkpdyx5FBx
	RaQLoNBBelYtpBvJGkdSMvH7dH86wTsus6ifPIx4Kvu3DCwXi5Skz3IjcowLfzgWhbXWlm0AYz6
	emfrqik2vJ16pz7V4GgpnwgqVrxYZtLQjbuOqvEeBfaCtzSppqyUScjpgui13Mwj6SNbFGxf3gE
	Aaq52Uf/WJUeMH0fRuo22t5Ih3CgtfgWLetgHANRU18KgTlXxJ95rGshbzqsPdfkDJ5nob23UbK
	xA7dt3bdulEK7LTRk6NkL2p/7HKzptFu/gPVCXHfUUck0oxU87qfEEQ4VZsWAfy77qJKp2Fiwix
	kQ86x2rgDcwzIx+dwC5/IVMXSxAJP/8S56X6Ec6SxMSCwGvTX8bSwFguvLVx8GZ9Bp6e/T9Cumu
	2pHXx01W+k+ryDH7n7O9s9JHL+xVmCzhtRK9TVCft+Ctvkt4vAuqKOLfvnngYaB31u8edsmvrH+
	jvlCWQA=
X-Received: by 2002:a05:7301:d194:b0:351:28eb:8cd8 with SMTP id 5a478bee46e88-3515ddee11cmr7825200eec.18.1791486073803;
        Thu, 08 Oct 2026 12:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b3eccebsm405691eec.12.2026.10.08.12.01.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:01:12 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org,
	Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [PATCH 6.6.y 0/2] asoc: backport CVE-2025-21870
Date: Thu,  8 Oct 2026 15:01:02 -0400
Message-ID: <20261008190108.96660-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2025-21870. They must be
applied in this order because the later change depends on or completes the
earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
These fixes also affect 6.1.y, which will need a separate backport; this
series is only for 6.6.y.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. ASoC: SOF: topology: Parse DAI type token for dspless mode
  2. ASoC: SOF: ipc4-topology: Harden loops for looking up ALH copiers

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472
