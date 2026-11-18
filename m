Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994729;
	b=dl7+POvx4K4tMtM/1fzsxxHTS3qPJnXI16jKZkWBio4mDR8fsoy/BNC3cB6f2tZDfz4v
	 mGyD7t63PHJYgkmT/ExVawHhBdgRRTvBXFa1DALik1lQ8aQgj82u7RYY8ai0WukR5dGZ3
	 nb4vx7kG3VGIrsuaDcuvbom6dLYJpGeQwI8LXsYt5HfIlkvRQTwiAd2MT5frhaovuNdgC
	 0QxRvqboJ3Yk73BLN6UiSXdUmso/uQe38Sf+FH8P4cgxrfo6heO+gtN38ToeLtVdXev42
	 9Wl8j1ATwl2S1w5zAbeCvlfMk/5F4YxT+cTUxiKZABIpN0d6I3NygzduTyK2lrt0XqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EoVi5OLZJP3A1SAJtxbZhp185rOwOMxBLlAcSVrk9r4=;
	b=c88YGf78tQtyPYS9l5Y2JRkhQZnZS/C9e1xmXEGBs7KSi30JRwFwgTXo0RQF1HKPWxXq
	 LhhZt6mAn7VglavlRWi/gRJ/1PEFXWhoaDKVOUxm8OLrCEAZsgEELvKPgGaRkvnHXQ2GN
	 T7yAF5MQ+LEUEmNtrRsOC2bKYh9dCCu9rpvN7wPt+Gv34E7PIrLmlK6D+UebaEhxlf8n0
	 fubPf21Du8zcc8YefD8Y+Y91TclIQ685wCpPlJhVKQCA8elmZVLhRj/JGO9sdUaXgMpre
	 FS8kxT8Ec6l62181II/nTZGR0m99PZxDwTRgRnxBLBoPKiijyi196W4Aj2T4x/w1WSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykuIDjKe;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF955606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 09:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF955606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykuIDjKe
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so1915407eec.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994728; x=1795599528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoVi5OLZJP3A1SAJtxbZhp185rOwOMxBLlAcSVrk9r4=;
        b=ykuIDjKe87ULhzS2sZvx5Uu5vokuh2KsxnnS7rcPuV07riEQHxy22Io3ChHq5/9TPl
         cgQ9pxN9RO/ROM4OxTT2EiZUB3A9ZgJSsb+L/qBVjV0KbH/NPS3eqFhdqTl3F/FeRD0c
         /g38MnX36PMtSDzLAvgqflq8E7rpulCKzxp18hsNJAehmnvTGE7lo0uf2cdL/IVikjy/
         INbtiAfVvuUmiyXKSwiGxD2RVlp9eJnqEGudZ6S6WpLm662laLjxK+uEX6fvWKg/BlHO
         JBMj9+6P+rNXBhENB+RHwB+fYW7l/ItNAuM8HSWCkbC0UU/K0ut4f6YqUGUVPob/KcwO
         NqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994728; x=1795599528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoVi5OLZJP3A1SAJtxbZhp185rOwOMxBLlAcSVrk9r4=;
        b=aWIY7ZLckXM85a+y97itutp7V0OSFNpgD96ox8A9gMzAxBX65TXHNzByGDpvxnJXb/
         mlF35kZwVoIsyKpOXmG4yy297vYFAK9396jEFtGNVz6dYdjzLkWnLyA82FLUamWGIyr7
         4Bzf701V1IzOpJ6tDU22TL5cvEL8QtaMr7HlA2qqH0HzLOeV5LcBHxR2dPd6Y144IrXk
         ISNA/k/rerVCP5OCAVuC4Es8M/WL2G1KMJs5q/GfRV46MhskNjGGUEIUV1XLV17+Ll3o
         nWafmgFQ+oJx9pXgMEWD26c7amGBMa92GdiEXHLq5XUpJg9XGRLSudZfwLEKw6L5O7Dj
         8p3g==
X-Forwarded-Encrypted: i=1; AL+hErEoEY1anE1kUxZocdvEOqEpnHvsAWge8u32ccW9ZWGyRIIpYHnRxt+05DDL2BZ+6w46r42XpSngleh1lA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jf9ZZDalGkDeRP1/+D0A/HnhntD2amcyvCkiIykFXGVqrEgMd
	EGLZN0J91TqDBnBeu9jEeVwDOz1r4soVaOHlj+I5x+7ss3nlBBd4Lei+
X-Gm-Gg: AZFdTZcsS18TbcIt3PNstR5sJpy6vVe12y0uHwh1ZBHoQzdR1lneeM/iT77at9EmXV1
	fYp28gWFwpi3ogtSrKPjfKtDO/a06nZhkOJN5mML9EwdRG3FCnG1UsEtcRIHWYaqGKB4gtxzg+H
	XpQc7OZ9qna3PeGD/xY/6YYRYQZX7rRrk1zvHz32XPI+iKfP1Nc09q4oSr+5Q+XPBJNiO7Sbr2x
	dolOq4Mhk2iLBIYtZiNK0FtFSpQY7NGdEYOCJSIizAk+wfkx3q/iMHEBLgZhzKL7XlHGYS/9PUo
	o4x1wSTzVVgiyVoLfuMkKeJysT3Nlzyd6W44THKmSGvimeouHjKHeWGPRDlazd97+IL1ZPf/B0K
	OarZO4a5jV92mWRFfjSXYWMJZfGxNiTgHme5hr2euB1Er869Yjno/vExWv+sCjegUa1AuqAwweS
	kDi5QiJ5k298kT5jHXQtCWRqNrMMdmDANPpQYAjp4LxA2XMLBYYcPEzU0XQjPOwQQ8GFaeY5m5i
	QbCAhjQC5zK3YfecevFrIKc+q1Dj3jgiSDwFrRqJCLMqKW+IA6go1fUw9t+I8y1ZEWX2YTcD2My
	pdy+vJvhL91zu8EXaDjAlJLNlKQueXtwxndjG/684leGWO8bDWjWhuz3AQotdlvgQhxBsLPlh5d
	dZHQ6LUhsx4+5OJTxn3Aq9BCv17RcQw0vqEjzO8Y8
X-Received: by 2002:a05:7300:b196:b0:377:678:2309 with SMTP id 5a478bee46e88-3827fe76e1bmr2073650eec.15.1794994727862;
        Wed, 18 Nov 2026 01:38:47 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6365704eec.22.2026.11.18.01.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:38:47 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] ASoC: SOF: control: Check the volume and switch values
Date: Wed, 18 Nov 2026 18:38:38 +0900
Message-ID: <20261118093840.3514408-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

SOF volume and switch controls accept any value from user space. Patch 2
rejects values outside the range the info callbacks report.

Peter pointed out in v1 that snd_sof_volume_info(), which the controls
with more than two channels use, reports the maximum differently from
snd_soc_info_volsw(). Patch 1 makes it report the same range, and patch
2 checks against that range.

Patches 1 and 2 of Arnav Kapoor's series overlap with patch 2 here:
https://lore.kernel.org/all/20261117105953.188645-1-kapoorarnav43@gmail.com/

Changes in v2:
- Add patch 1 to align snd_sof_volume_info() with snd_soc_info_volsw()
  (Peter Ujfalusi)
- Patch 2 takes the maximum from the helper added in patch 1

v1: https://lore.kernel.org/all/20261114021730.2349347-1-sammiee5311@gmail.com/

Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3,
sof-tgl-rt711-rt1316-rt714.tplg) with only snd-sof replaced. The
mixer-test failures went from 9 to 0 and pcm-test is unchanged. Out of
range writes to the volumes and switches now fail with -EINVAL, and in
range writes still work. The laptop has no SOF control with more than
two channels, so patch 1 changes nothing there. The reported range of
every SOF control is the same before and after.

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  ASoC: SOF: control: Report the volume range as ASoC does
  ASoC: SOF: control: Reject out of range volume and switch values

 sound/soc/sof/control.c | 49 +++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0

