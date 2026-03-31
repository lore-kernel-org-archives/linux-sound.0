Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4338838F;
	Tue, 31 Mar 2026 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943683; cv=none; b=GW6f1mW93y3emDc5Wi2fF6svbDXXyYa1KhQgtTeQqONL4kA6T9nMkXN30KdNnxR7sznofqkDhxm4FdJ2AQZmQyyz8qydBeh+h8+XIo+Jeiu1hnPcj9KFLTTW9IUcg3F3k3Fsg37FR28qVFe9r43VZVrtWZaBi+dTdsfxyG6UXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943683; c=relaxed/simple;
	bh=42fjATDhzkrj2h08dZgqwo2096DndPMjkKfd+0wRsdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aiHXQOw87MXOjLi/4ML+38JD/tx0VbUm3e9pZnANasmB2c82AUXGpI2LgDtT7I6jNg5pJYXOL4q6q1t+Z4vETRC55S1WE5SpQyDo4DImyauMd5GHsK5pK2s4DLR2MSTZ3/I5NgxmTqW5ztiJAfRoUbRTH3bR4RBrXCxNgAjDR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=g7zjL0el; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="g7zjL0el"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bA
	Jfiu75YhSqGTErFlkxu4ytQHR0wnuqDX5blhdw4qM=; b=g7zjL0elE9HCHY1Y75
	otZ82EwpqMGG+kUfdqlsxVN0q6dN0tNCVREOHNKAiC7yu1muthQkTWApdm13a+DW
	yN2wv6R1BbjrEWbZruqhy2B1Va+9U6SXvPrt30ZQp2PLKiqceER+wskaZQqyuAwt
	gIGe+ciliRjnpDwm4MJBkZNAQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXnTSffctpabXFCQ--.1452S2;
	Tue, 31 Mar 2026 15:54:09 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: fix code style (ERROR: else should follow close brace '}')
Date: Tue, 31 Mar 2026 15:54:05 +0800
Message-Id: <20260331075405.78148-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXnTSffctpabXFCQ--.1452S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy8Jw4UGw4fGFy3JFyfXrb_yoWDZFb_Gr
	40v3yxCFWUCrsxKr4qgrnFvr4Fvrs3CrZrur92qFWkJws3Gr4FvrnrXrnayryUXFZ5uFy5
	Jay0vr1UKF9IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8hjjDUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9AHUy2nLfaElWQAA3o

From: Lei Huang <huanglei@kylinos.cn>

Fix checkpatch code style errors:

  ERROR: else should follow close brace '}'
  #2300: FILE: sound/hda/codecs/realtek/alc269.c:2300:
  +       }
  +       else

Fixes: 31278997add6 ("ALSA: hda/realtek - Add headset quirk for Dell DT")
Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 09af4d378b30..afe13a7f2673 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2296,9 +2296,9 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		alc255_set_default_jack_type(codec);
-	}
-	else
+	} else {
 		alc_fixup_headset_mode(codec, fix, action);
+	}
 }
 
 static void alc288_update_headset_jack_cb(struct hda_codec *codec,
-- 
2.25.1

