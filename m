Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6D3115AE
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678988; cv=none; b=qfPDZJOVdF0RFqlh9NO+i0Qd4ZGSzBUF8QyRRzXjgH9JugETQKO9CnNOQCQfe23zLCXKr4D2y0lor93mGTQ3ZAjnrfAgPVjtjMz6E+o4st4cRoN63YEeBoFG5nI3yZg0qxyqprtfWhiKBSCti3ssOHiecfn1oqz9NefwD8ZSkhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678988; c=relaxed/simple;
	bh=ToU6TLY11m+nFOq75mgRxdzlInrWbZtUGyp2whM1Ayo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ac8UiQx6HYwYmZWzb6o50T2A49cuwKygQ+AM4te5P28VZ3Am9xuTJU32AhtyyNZYphQ34fmAkv6A+ANpU+5mbvx9WJ/E3YuJ4/RVkbdTyoXj+5MtB3yjPiClMUObrxx6TishSStbdani9ayeU2rxAPMcaA2lsBSpwyMJLdXQKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=28M/huHv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="28M/huHv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so9361198a12.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678983; x=1765283783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pAd7cOetmebuJwnycjYwid/ZP+1NHa9CAnTyUF1mjpg=;
        b=28M/huHv1puQoPFROBAupNk8eZ+PFl57cyZk1TvuQuBUIqyzCNKQRM3slboDqJwRdq
         II8D9bMCXQbVLNTwgAOKlOB+9JmBfVBYZHWfRUJae/cUJXDEAFGmsRtlyuL0tmjrnXnE
         AFzLJbDVsd2LZXbtN2mIj3Ryz1LfBNLG0nYAUvfPD8xLGqHnv/v0A+ZrS6oSZCA2lqDc
         86nz6GPelOSYpDKpb2+F31PFYbMI4cNRbFF95KPvYjQ3OoOrTqH6zYz2G9otH1R6Y7PO
         Ljwo4l3vPaAxhREL9APL00dCTqNXbCXW3etFcqjLcXeprVwF83FsV8XHgK7BRztsLrWt
         jn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678983; x=1765283783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAd7cOetmebuJwnycjYwid/ZP+1NHa9CAnTyUF1mjpg=;
        b=QELzqNcqic2yPIE6U6N1luokje136f//VudTo4sslF2n8dSca2qFgR7FmJ3qwkpTAr
         xhFHj2XLB32ZmInyHFTGZTGBrxMidurbZzaevle85ytaRoM4jq/ksFWRPIIHdquKkLLA
         qA5WFju56evwj0i8Pd/dvkU4hKT03eJDhim1S3lRTCgIc90ClBr0qDkyPGN7Yug0J+Rg
         WB0h5CHLKZ9wpXlNbRBlgWhAtGIB+ipKD//Rm2jGFDOLmF8s5BKLcaFho4HhUsdQS9zq
         nv+YCbNlHDjNomyQB7Tfu/cFCIBtTXy4/0+WEsIQzUCMPJ8w2/QbLj+f6hN3k1i/ko9f
         /elQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSkjNKaaUnxsQvUTQB6ZlN4AKb9FgizJvjo/5zl9i0lA54gQoBtkhIsoJQAiyBLqC/y8uPbNR4GYj9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOMkmc4FpMzpiquJ24SuoyjCVt9+RsNFAlbTycOrpEmZCfym3
	YaEVJSIadMF1fRR3RQGL067myb84rv2i516Q3lqSOz+/WQPJvIa0+n4TBDK6trexaEM=
X-Gm-Gg: ASbGncuE5jjRgF9zBnOmigdUNA0ES2nC9VivAjBcpkhvUo+2fGgCcSHYl8KlhnfZUpy
	QgwPjGhyQzYJMdueUXI4i2tSoW5VkbvW5KQb923j7jB8+eJwF07z0PoYCG8N6bgueQafaV9sUGb
	2ZywKRfdsOlfwp0k35/Q71RP48hEp8RaZRx5IlKCyQ407K7V7xjvFvxgsQCKZezn+GfkbRQ5sDa
	pDS05EaZw95OkSLy+DhPJI02SO1LPRl4a36vxPZU9z0YAGSh8SWD7h68IVlQ9doW7hhNcG4imV6
	UaEb0mFXWqYN/nlilHYY972/NniCaQRRz+o0W9ki06ZYfLVkZHBs8A7ArHlN42gsu58ANmQj/dd
	IwKVoEEpHeT9iTdEMfdhAziNo6zCII1H/AF/ieXxO0rt5snr2droj95mou7V6Rdd2qAObwqmXM3
	MKwuryy/6QOpPb6tnjcr7CA4Ny9KlPQ+mPPnm9jpJvg+Ny/kKMD3YbZsymLT1HZ0JOOeagY/L4R
	COWlr7weWbFXQ==
X-Google-Smtp-Source: AGHT+IH9ixo/nTHsLrvlPfhSIGX2z3+MRPSmfe4AS0u7W0j5IkvLERQ0xv8iloC1rIFtXx2GAwBFfw==
X-Received: by 2002:a05:6402:1442:b0:640:ae02:d7cc with SMTP id 4fb4d7f45d1cf-64555b858f3mr43941669a12.3.1764678982968;
        Tue, 02 Dec 2025 04:36:22 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64750a6ea36sm15261208a12.2.2025.12.02.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:22 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/9] ALSA: seq: Use bus specific probe and remove
Date: Tue,  2 Dec 2025 13:35:49 +0100
Message-ID: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ToU6TLY11m+nFOq75mgRxdzlInrWbZtUGyp2whM1Ayo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt0mODsZlg4xftU8HqH49rP0vmQlY0ZPoy098 G0lsO3d8LaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dJgAKCRCPgPtYfRL+ TuSHB/97rS6sRyR3Ps5/JJbyVxFeATCbx3x3zaJufBDYtCCtHFdFlBEdZflO5FWNiSQQkN9ZxRl u3pNdglibdckqxBw0kd/rIisumB6LU0gfCyoTbGNBgQCDXh/P/zmKcGuqg6wg3RsiTZnoi1lp6g 0ByNWyVxadIOXXqHj840sypRUC5fHjy3Nkiw79gQGY07pbeoGF4Eb4Br5diRot2WniaqFa+ZtIj c+py1gzThsNzBIsdn5bY9suQDjR+FwhWpDbu2gDvAycBa2zdphtPjSkmY5wt3y4EAzT+6BVHmCg kjwJeicuquZl/+Kng508JEZSpf3EtoVyAltntV0ES6wT48en
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

for the quest to drop .probe(), .remove() and .shutdown() from struct
device_driver, this patch set converts all seq drivers to use bus type
callbacks.

The dependencies here are:
 - patches #2 - #8 depend (only) on patch #1
 - patch #9 depends on #1 - #8
but I guess this series will go in in a single go and there is no need
to coordinate merging.

This series is compile tested only, as I have no access to seq devices.
Still I'm reasonably sure that there is no user-visible effect when this
series is applied. (There is a runtime warning introduced by patch #1
that goes away with patches #2-#8 again. So future bisections suffer a
tiny bit.)

Best regards
Uwe

Uwe Kleine-König (9):
  ALSA: seq: Use bus specific probe and remove
  ALSA: seq: midi: Convert to snd_seq bus probe mechanism
  ALSA: seq: ump: Convert to snd_seq bus probe mechanism
  ALSA: opl3: Convert to snd_seq bus probe mechanism
  ALSA: opl4: Convert to snd_seq bus probe mechanism
  ALSA: sb: Convert to snd_seq bus probe mechanism
  ALSA: emu10k1: Convert to snd_seq bus probe mechanism
  ALSA: seq: oss: Convert to snd_seq bus probe mechanism
  ALSA: seq: Refuse to probe seq drivers with non-bus probe or remove

 include/sound/seq_device.h         |  2 ++
 sound/core/seq/oss/seq_oss.c       |  4 ++--
 sound/core/seq/oss/seq_oss_synth.c | 12 ++++--------
 sound/core/seq/oss/seq_oss_synth.h |  4 ++--
 sound/core/seq/seq_midi.c          | 15 ++++++---------
 sound/core/seq/seq_ump_client.c    | 11 ++++-------
 sound/core/seq_device.c            | 26 +++++++++++++++++++++++++-
 sound/drivers/opl3/opl3_seq.c      | 13 +++++--------
 sound/drivers/opl4/opl4_seq.c      | 10 ++++------
 sound/isa/sb/emu8000_synth.c       | 13 +++++--------
 sound/pci/emu10k1/emu10k1_synth.c  | 13 +++++--------
 11 files changed, 64 insertions(+), 59 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

