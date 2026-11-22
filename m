Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338434;
	b=WbReLx6sLv3BvuNek86zVzMkCS4Inw/Vb2zZY/Bzo4KxMCWQQZGGiuuriMm25NCxv49P
	 iEDE6CT7I66ByDcjMi5Wwv7yMYl8+GmUbPjg2xRzT7FPtR2S12wPEZ7VZ1VT4Ovkat8jm
	 vbZzu8JppUgLcUZuHc7vRY4jjY1fKa10n+LeVenpW1Y1dh6/w8rurYNhJFOB5UMF4b+Mv
	 yXqvHh/ooQL9raBiOm3SFrFFrKWabjGAg3G9k44QDggNq81YV+rJgbP1rlyeVZmvDR5Eq
	 NCVgV6HsGigPzJBEVrITH9jEX2whLDv5MDkWfNtlgW289oyGHx5Pbu9yqrds0KqMqLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338434;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=PxxDsWJ8C451dc8OxyZX6CpUDyZbtfZsYLlqNE7+IvI=;
	b=f+ma2VOBud/BE5fb0FxN1LUqPdGgcXGYw0O8FLQuWvDTwHiLE2+LxI8YJRUIFcTyMFt1
	 IENKBeQ6vQOLWPoEwHPvwPZS3mjIhaTqZNZ52bA6u7j9UutffgMyXn/cTrbAx6izx4cUO
	 /VivyGfhyCtpsjGBWR6RAJOJPcn2OOxKC4hZ6DHrq+Ch3mjxW1WfTf5H5R0HZpdaa3LY6
	 RkyA68k4i/Ixh3DS4sJ5TEDiqDa5xiqq44y+tUgmrNVWpw9r02FzCmfl9VQPY2foLyAMG
	 u2T0/Z7mIX+Vp6hhXDeJ/Lvu2QRwqa6AJ7p/P1i1IYnth5msfsnv8OAbSkWG7w4HCZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=H3iAme9t;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48E606A32A;
	Sun, 22 Nov 2026 09:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C48E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=H3iAme9t
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jXNW13MMYzMkyn;
	Sun, 22 Nov 2026 10:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795338429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PxxDsWJ8C451dc8OxyZX6CpUDyZbtfZsYLlqNE7+IvI=;
	b=H3iAme9t4Uzw5NDQd5IqBSEMPqSmQHJLUR42yP6z60cfwxkuPEmMf7U3rGXd0Z6kg5JhyJ
	qr1tezDKiPVGYm31+mq3tUNuZAjYc+RL7CJbdZ/s3AHfXXlgnBW4zbKn7VxKeUxhhhRmiM
	Pgx4nIQsV4BSWEH86xRhwnlKR+xY9GXzV+6yxhEIKV39kCfsC5FAh/odKp7TPow5yWbn9z
	kai1NDvc/so8Sjq+LYRlDpdsgAFTNIo5xodF1RZltMms5rgPOHnderJVFzj/jRTgIZa03a
	g0A57RLuCkNEJm+UP6t7bE0hIPSeWSAfjTsbDx2HZz+emh+xJWor5TcOKUUC/w==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] ASoC: doc: Fix bracket
Date: Sun, 22 Nov 2026 10:06:40 +0100
Message-ID: <20261122090640.1475222-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-META: wjbtburkytxuc5m4cfhqia66bytu9huk
X-MBO-RS-ID: 6d5ae6fae88b1418502

Add missng  '};'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v4]
 Instead of remove {, add };

[v3]
 https://lore.kernel.org/all/20260916113524.304863-2-manuelebnerli@mailbox.org/
 - removed the change of the placeholder

[v2]
 https://lore.kernel.org/all/20260904120737.758809-2-manuelebnerli@mailbox.org/
 - rearrange lines in diff
 - fix commit message

[v1]
 https://lore.kernel.org/all/20260902150510.706055-2-manuelebnerli@mailbox.org/
---
---
 Documentation/sound/soc/dpcm.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 7b6aeab3c2..3b145e8ba1 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -370,6 +370,7 @@ The machine driver sets some additional parameters to the DAI link i.e.
 		.num_c2c_params = 1,
 	}
 	< ... more DAI links here ... >
+  };
 
 These parameters are used to configure the DAI hw_params() when DAPM detects a
 valid path and then calls the PCM operations to start the link. DAPM will also
-- 
2.56.0

