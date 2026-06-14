Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451B31B10B
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440836; cv=none; b=stsgrsh8nXFrORf3hYScybsfYfrgXQJo9fxWKqh7y4QO9nHgPhR5uqSWg3Xw72cbDxN521Sjds7SYTMDz+fYiunzhQTWEs12YtX1BFEu7cm2vs2vGXtY5wyEEpwl/bNOHqGovrFfhtM09vx+DN175ig7tRugKE58ofsTIg23M3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440836; c=relaxed/simple;
	bh=G3UiUPakszrQsdZ1NYoTaE6UW7brKl99FyCoHBmB2gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFbNzhs9ngGV8jUDrmhbQLddWqAkiA+AG4o6w9yx9dAzqkBXE4VDdIrjU/gmB6zdQKPldgwuXXDDcAJNjiU1MhCF4g7FLYw/QGaaAYJwt8x6iIo2ATKIKioTqOLqr+WXBmCPFr8QcEN+Ox8fQno/xUaIWQboF66ckKm5wkE389k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNDcWNrq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNDcWNrq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1165720f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781440834; x=1782045634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq9DLY+g6gb1X5/j5vr2DD/jY8ECHzFWcSAy1jao/X0=;
        b=tNDcWNrqBse/WKHego/DLJP3nfBpc7T35/whINhwEu9tXDl9wq1Ra9TiEgsLcd4P7f
         yaW0HH93zx2/ZrcRYmy+IBmbwKktbiDKiSjvD8omxcmXgfVOcN6wFhuWA4YrWFEjOkXl
         UlNa1FPvtbelwI/H1ujuFUpdJfXOEftUi+1mjSUQYXQEvfv4ZY6ZJ0cKai99xKW7WQUI
         rXWao8t8tolKve8iSEf2F41oGuWF6f0/W/1VonDaVV44/j2dOcCr3EsV3nFiuNIQTo5h
         S8PUEyh4U8XnSUADJDqxaBuMOXhdieqPcNmAlWoSLLfiERDMNbdftkst5wd/WJ/a4Qcv
         EO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781440834; x=1782045634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vq9DLY+g6gb1X5/j5vr2DD/jY8ECHzFWcSAy1jao/X0=;
        b=d7c+2gXa6AGi9OtmaU5MTQxlGZB0KtWLZWFGRaQjJ6oqZnoMCdDaCA0L0UpsuSdDL8
         8R9f2Hi13SI91r25lOcmP+GId/oLTd/YYms8jz/jUWQpDJFRHQgn+n/+vo/9E83yX0fX
         QN2PYR8SfoC5C+tdxpCl/ulLHKF9a2LEFC2DXlOYz/ZOBphnyCpVne3PzoDiTv+TEXcV
         e30eaSGzbAHrN+ayph56F5zGtcED3PKa4rtX/kV8wc+ZNFQFYAJFKS4IKJ3QVElbm36L
         4nL+eWht0fYW5qt2AM7E45NVWyuFKbHl2Focph80P+bBU8I8lSShP77AqP36G3ISuZbK
         3Kug==
X-Forwarded-Encrypted: i=1; AFNElJ9viH+slTuLFFKRhrYNuTp3qFYNbq8eci+W3FYd3kM1ihGGUq7W2HGklXReP8TiOW+jwZ19zl42adShGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzauCCFvQoRNfX7miExoSc0iyjW+Fg2E7eZqXEho51CoC9vKOcw
	KMIllMRuordpYyxx47ERDLb+kHOxMga2pJFlw3IbUlYvsdP6muHYqa/0
X-Gm-Gg: Acq92OEP3OAQJsfGakTy7N6P3vg+RuDas9Vgjk7d4edR34VmycEUd5jT2Chr86Rlt1X
	4BkqvEDdsO80nUH755H7sVOYrAy/w0XupJYLZGwBuIjR5+Eu243Up2FgDXIvp46n9IKvCSw/rKM
	EfkLfMR6Pss5wAjengoJy+a3wH7Vc8l28rEjtzB8qBRH6KG3WItYwO9uLzwriIGYBShbP17NgRN
	JNoIHglh0v1DLmBMlPnCxRo5LVxk+vpsZobDYq0r3Sxzm6ZLO/DnngKX2VnDXxQ53A6cwM4tK4z
	ohWHliWlRkYIaUZ4baKLvnH+emv78yqbQbTAcrWmTSOW6OV+HJ1iTB3CocGWjRP9jxhv7UzewBK
	qVH40Z25Mbd54bWXd+rjbub2cDXNx15HpB/g/Pe3FdodEZFhA5y721kDM2js0pPJmbTzp9jRW7k
	1mXiduWVzOdHfj57YRRcKlKDo2l/A0SETL49hQK2XyynXjT+IimQ4NqJeSwinW3ejnKzD2oQh7j
	IItzch5i0JvTDD3EzBAmmblWJ3jqw==
X-Received: by 2002:a05:6000:18a6:b0:45e:f073:d2fd with SMTP id ffacd0b85a97d-46074a52953mr7793368f8f.9.1781440833771;
        Sun, 14 Jun 2026 05:40:33 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395eb9d8178afcc325b543.dip0.t-ipconnect.de. [2003:d5:739:5eb9:d817:8afc:c325:b543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f4f6sm26271242f8f.16.2026.06.14.05.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:40:33 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: Return error for invalid number of formats
Date: Sun, 14 Jun 2026 14:40:19 +0200
Message-ID: <20260614124019.19259-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the number of input or output formats is zero,
sof_ipc4_widget_setup_comp_src() and sof_ipc4_widget_setup_comp_asrc()
print an error and jump to the cleanup label. At that point 'ret' is
still 0, because the earlier sof_ipc4_get_audio_fmt() call succeeded, so
the function returns success and the caller never finds out that the
widget setup actually failed.

Set ret to -EINVAL before the goto so the error gets reported.

Fixes: 21a5adffad46 ("ASoC: SOF: ipc4-topology: Validate the number of in/out formats for src/asrc")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202606111431.Uky3T0tF-lkp@intel.com/
Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
 sound/soc/sof/ipc4-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 95ad5266b0c6..8ac7dde32f77 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1127,6 +1127,7 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 			"Invalid number of formats: input: %d, output: %d\n",
 			src->available_fmt.num_input_formats,
 			src->available_fmt.num_output_formats);
+		ret = -EINVAL;
 		goto err;
 	}
 
@@ -1179,6 +1180,7 @@ static int sof_ipc4_widget_setup_comp_asrc(struct snd_sof_widget *swidget)
 			"Invalid number of formats: input: %d, output: %d\n",
 			asrc->available_fmt.num_input_formats,
 			asrc->available_fmt.num_output_formats);
+		ret = -EINVAL;
 		goto err;
 	}
 
-- 
2.54.0

