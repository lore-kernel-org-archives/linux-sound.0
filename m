Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811F4252AC
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981911; cv=none; b=I2HYpgb4atmb80qCZIKuJSZJBiDLk7Hc9kGEh+NssjaFsUENuj61gE6S9ran+3gcA1DfG3zxF2iO/OFLkkDteYMFA7zy9402206mbEPBNc3JQA1zZkA8ctRxrck00EjMDYt5RheSzhtOvHS86pAvOPGEpv4WBVdTFfyWc+UWRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981911; c=relaxed/simple;
	bh=4wUOlaRIbhKBaxGXz7dOQvYCJ3ALv11ugMrbqSWl/Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhGWt4nzWFrm17WnALKtBN1aTNPkN6q52r7O9gsAyVs6Hixprk5ZvWuVLJQsrP4cks9rbdxaRzCZmo7YsU/MimlEY2q7CA28ZR55H7L8VqRXJiIBsnY1YCxGI84qNmeD4P+3GVk4CITPRixI68rskX/qgpgSocnePtm9VsDxPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY4IFNcl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY4IFNcl"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso1626398a91.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981909; x=1783586709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcRYwuw5PQQfqSUU5fD6q6zAC9xCDDszrpykhw3M5xc=;
        b=sY4IFNcleA0l4kkm5WJ+L8uiRKeOeeGautuLzuNjhW+50inl49CMC0DQBoM9uJkwiE
         7aqI1IHJvJ/RWYc29TY4fOVY03l2tWHPj3qlDnAdca0Z2qS9k6qS6d2o34mpdFG7Zxo6
         HPgt+ZjgvTXV34XqbCqqOu0OixK8gwS/P7qGUUnuUJz+dkjaB2WtCg5oG5S3jtOp2FW6
         6u7p002tArw9Ms0I4YXoldRYYFGflduaIFnBWmy6b64WOrdcQ0LSgXBm3MJ0K0mqbPr4
         JPmUwzCIUmGc+yU80byv4wOct8KDbMNPBvpjBXjxZpAk8un5m59B9xt/sZFhJUN6oHMD
         E5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981909; x=1783586709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcRYwuw5PQQfqSUU5fD6q6zAC9xCDDszrpykhw3M5xc=;
        b=AVAqQuXRVdroB+Vjkq5JHFPMNRuYWzn+OhJAUhNmU3W8RwWvQztn2hszaS9jQtDumd
         zUQRYhNbdTxaAExsHUF51q5aa6KytxmzBffLjlQVXOc/Ww2//dlZ234/V38llnFSZd+H
         X35B/sOZoUOjSgW5RJcqJ86ZGD6lKjiHinl+mxYHvfUx3C66JwFP8OY7Ri41Grj35eBx
         nE2k7MwCD7fg2y3Dnyjah0QPeaf7H2nzuJJdYqe5M1gVhxqQXcRc+brkhHxH/tGeAoFN
         NPilaSUS8Sb1wKsOWfQTaAUafOmCsAOIVfqhOv0dhFOMCOFZcOpFiKMAOkZW/bODDeIk
         xZQw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0jsTi0fEvsUFH0RhUwTvVsfiqaYwniSEYNBJEgiLi0ZI9fALC7QtP1K4FyKJSS+6MPKJ/UhfAA3IwPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiz5G/gTevCKoUumuFVclIdka6qUNGRuH0dbNRlQjdPEDG2hsz
	LNEpbRxrufvAB4igKBWDQELbJ2DPXvunCyvX53DgBvnx6iJa5CeygrIv
X-Gm-Gg: AfdE7cllghUWtCEC4r24NNb2lWmIGgVCoO7LVMCl8jYrej3hf7OzyDGClWPNuSrGN+q
	brgTgAOngPhxLjtnjhGqoNZu3nGUCUdDquuVkt+M1j6ot/5+fnlqlmzqpiARlXcW09XaIC1guMF
	fr2McrABuSShpc0YjO6AylZ4RBsgwd4iUQAynlQaOt81Uqz63wieJ/JudlwNt2hcpzUQzr1vvgb
	cXxfczJFQDKOgC/xoq2TaTo5eYuXInhYhGwE5B/fArh/+qm7r8GiLAULARC7bv9nK4iB+vhbK80
	5TDcL/xy0+UhjP7N7vi0MJINDk1zftQWNbSUA6+6lDIUDtFIbIiLKsxlVzPyweU4YkKvJj9iUky
	KsehRcLXF4jP5c7SfGkVEpj3QMmiFFgi1ZtrFVTOd+hUN8zeMDzel0b7pItoWf9BO1mPvqJqHuI
	troA10mZ6uua2PfXxAXCyeXnlWaWEVfJZT61aJLQJ/C4q+36g=
X-Received: by 2002:a17:90b:2d90:b0:380:9d0d:7af4 with SMTP id 98e67ed59e1d1-380ba86979fmr4587276a91.12.1782981909211;
        Thu, 02 Jul 2026 01:45:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ziqing Chen <chenziqing@xiaomi.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/7] ALSA: Remove redundant open helper return checks
Date: Thu,  2 Jul 2026 15:44:37 +0700
Message-ID: <20260702084445.519669-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series removes redundant error checks after calls to
nonseekable_open() and stream_open() in the ALSA core.

nonseekable_open() always returns 0, so checking its return value is
unnecessary.

Several users were later converted from nonseekable_open() to
stream_open(), but the original error checks were retained.
Since stream_open() also always returns 0, those checks are likewise
unnecessary.

As a result, all patches simply remove dead error handling paths with no
functional change.

Change in v2 : 
 - Drop the unnecessary assignment of the return value from
   nonseekable_open()/stream_open(), as suggested by Takashi.
 - Merge the individual patches into a single patch series.

Best regards,
Phuc

bui duc phuc (7):
  ALSA: control: Drop redundant stream_open() return check
  ALSA: mixer: oss: Drop redundant nonseekable_open() return check
  ALSA: pcm: oss: Drop redundant nonseekable_open() return check
  ALSA: pcm: Drop redundant nonseekable_open() return check
  ALSA: rawmidi: Drop redundant stream_open() return check
  ALSA: seq: Drop redundant stream_open() return check
  ALSA: timer: Drop redundant stream_open() return check

 sound/core/control.c           |  4 +---
 sound/core/oss/mixer_oss.c     |  4 +---
 sound/core/oss/pcm_oss.c       |  4 +---
 sound/core/pcm_native.c        | 14 ++++++++------
 sound/core/rawmidi.c           |  4 +---
 sound/core/seq/seq_clientmgr.c |  5 +----
 sound/core/timer.c             |  5 +----
 7 files changed, 14 insertions(+), 26 deletions(-)

-- 
2.43.0

