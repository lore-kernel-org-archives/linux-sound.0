Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF7F2D8385
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296239; cv=none; b=lO2M9+7t/JXRviSfBMifvCPROxo/I71jLvZYyRVqFUY/9Y59I1n7E+vu+brojaTR6eoEjm5OPDiaq1PH+zhQ5bG+sTLi9BugDBG93VyOuamRsXO90pBDaVGWrE6kM0XwQLa6swI9NH1CA+55KIU7HMZHQ7dZQiS8Xt8gCwPhAzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296239; c=relaxed/simple;
	bh=SYUFyhH/BXX/6nJF93wJShpOJcf51QkPRK14oghc66I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuKfqnJ8fi9bX4Obhzynu56vwMAUwu0Df4Zy2X5DHv+rAz4+0Oh526G47tBBuHB5CihIzWyvWo3Re6SbtnInt0JTKQjEFR37MgYWwWt1ui4SGoDVDt0pAUy99812dJXq8JXb4i3JUgb4uev/6fBwcyFlpWxMpIALBNdhcK1zDSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5Dr06uc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5Dr06uc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1473095e9.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 17:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296235; x=1790901035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4FQt/2JHKyOkWN6EVF6z/4Ft+X/t5H4jUVKjWEtOa0=;
        b=M5Dr06ucwDIPk6UO6RI2lWuYmLNJv5ajfjvmbDUFF567n8gJbi1N97Etq5PX8e2Mst
         KGMGSXIm/Mj765MGmxgWOECSuLmE4cbIch6mi9gT+bJieDoipMttawWj5+0KZK3lCOLO
         dCu1X8LCvbRTabqjgp9ImdZ0Mb23UmcSyLbavPATp77a21cBPKG26K5VRrOR5+svoO2w
         Yg8SiVN5cCtLKGJnYYuw0jqA7kH5/Mx0An71yqV/NQF92ThpsPIBCDmpVV3XJ34drMJE
         ECPtZL3evH4QTcDU7q+wsVTODyAbCI13+6eTNTWmjzVY8VDCTX2L/knXatP/X3L0qs6p
         DvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296235; x=1790901035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4FQt/2JHKyOkWN6EVF6z/4Ft+X/t5H4jUVKjWEtOa0=;
        b=xwLJ3FthjvcLVfL2TKKiPR12cxd9FgOB/hNYpt/UhOozTV82yhFRA42jWPIoSOAyEC
         2s4WFnGcBfxAeZm+JCFLALozdzspgFIc2b80PDkMLfqWJLPPxemfgTiqSMehEOFfivhu
         QxAt1OufT+gMQTDjiWhHRdqcwcAq1sbpxcqLyPkmoLQYt20yaXUK896umIppKxaf/SDW
         WukgSXxcTF48P5z5es2aCMbpf6p7uzAakSoKNrNfwZwWefNONiAxrq25Qli04RNk4DCV
         iSVgYThKtCejmfvWCOD6eMxDeaGYBotlu72XBeCZT3Mo8IN4khQmagmCkGoRWU5zoSJq
         5Oyg==
X-Forwarded-Encrypted: i=1; AKwUvBwxnx/TQNW5tG3UdQapG9PZ7Pp3fAo8FOm8QiN4om9WKkKl2v1pv1wxyd8AZKPnrocZDy248A1LkJgGrA==@vger.kernel.org
X-Gm-Message-State: AFuF++lavfDS2uFyAtH7qPHibHTdEn7GprpIRgj5HOBgn3c46CiKup6V
	ifeekHwIxjvrngDMhoOym3qKyMoXbEL6wgCAKbsgkCEHClvEW6P903R5
X-Gm-Gg: AYBFou3B5Vv34DSY4Gb8Bqhukh8KCHFhPdH4YLwKyGM5/1lCbzLZzoy1CHveM1Y5Mof
	H/8VfHNjEaUHb5HL3w66aeE5b6Vk7EMPluER7AWHgIedhbOkHN0fRkO3SmBvl80pyIBdiQOeYEJ
	8MGUUFpwq4pqe6PYU8YqKdK7VvkovvgxhmHBgEmRvPg78TTnmIV4IbIxRVWJ64LcPkdHfdt5cRe
	CVj5NvoaUs9fRsQi9Ck8c6oHtflSq8uj+W69pEj/Z+79TvkHNF1944UI/GlIxubiHFejsLf3HIY
	bYIwDAvDdDZG2BJSXWG4AhGFrAVtBh/UP5QPa0ywEfrjltUbtD7xe0V2Kl1sJfGp2GxTESbleGG
	a9jD+55XlENWCp6cEhm2nbt5GVFSg8CZlMYwJT5tc+IfYPdnpPGBRLb8uebOxDRrgXPq0i50m9J
	91XxOfZHkn1bI+gtHR+8vmlnlDweIO4fedVG2M3gHcmriyBvbwRaG30kYKva28H+3i+W3COCB80
	G7he1oIwF+kxM4jtAtrHi/thtPNK/bpj0XHCy0gOBY4HRf4z1iqS62Glyie8Os8LODzgBpXXFs9
	w/DHbgg+EB2JPVHt
X-Received: by 2002:a05:600c:c1d7:20b0:49f:e897:b62b with SMTP id 5b1f17b1804b1-49fe897b890mr45450465e9.14.1790296234488;
        Thu, 24 Sep 2026 17:30:34 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm34900745e9.4.2026.09.24.17.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:30:33 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v8 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Fri, 25 Sep 2026 02:30:28 +0200
Message-ID: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds the Cherry Trail machine driver and machine-table entry
needed by the Lenovo Yoga Book YB1-X91F/L with its RT5677 codec and
TS3A227E headset detector.

The driver supports both legacy SST and SOF. The Intel DSP configuration
selects one backend at probe time, so the paths are mutually exclusive.

The series has a runtime dependency on the Yoga Book platform/x86 v3
series. That series attaches software-node properties for RT5677 GPIO2
and GPIO4, which control the second speaker amplifier and headphone path:
https://lore.kernel.org/r/20260829225729.395270-1-mauriziocasciano7@gmail.com

Changes in v8:
- Use snd_soc_substream_to_rtd() instead of accessing private_data.
- Use the ACPI-enumerated "i2c-104C227E:00" name for the TS3A227E
  auxiliary device.
- Clarify that the ACPI GPIO mapping in the machine driver covers the
  external speaker enable, while platform/x86 supplies the two RT5677
  GPIO properties requested later in probe.
- Rebase onto the current ASoC for-next branch.

The v8 patches apply to ASoC for-next at 74612d0b448f. On the remote build
host, x86_64_defconfig with SND_SOC, X86_INTEL_LPSS, GPIOLIB and
SND_SOC_INTEL_CHT_RT5677_MACH=m built cht_rt5677.o and
soc-acpi-intel-cht-match.o with W=1. Strict checkpatch reports no errors;
the only warning asks whether MAINTAINERS needs an update for the new
driver, which is already covered by the existing Intel ASoC entries.

The v7 source was runtime-tested on a Yoga Book YB1-X91L with both SOF and
SST, including PCM0 playback/capture, PCM1 deep-buffer playback, built-in
speakers and internal-microphone capture. The v8 review delta has not yet
been rerun on the device.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (2):
  ASoC: Intel: Add Cherry Trail RT5677 machine driver
  ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cht_rt5677.c           | 653 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
 4 files changed, 677 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c

base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f

-- 
2.53.0
