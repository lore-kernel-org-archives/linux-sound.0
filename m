Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A05346FC0;
	Mon, 27 Apr 2026 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273712; cv=none; b=WyXcD4wfi8FDDdwP/CgBX2dv5BETp2u9XoLLsao2JcX2CV05+tdslCNhKco+3noFDGcI7rKdQgBU+Z6l4OF1RgVsf5IezdA5qqQ7WaCg6khetMuj7M27uwtFLdxir+ZjnudNWURmmL16zWcVUFSXxCgrUmeQ6qXpaYaRDak9UVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273712; c=relaxed/simple;
	bh=abPqWIfnaqiwS3BefyXZW2qn+kzvbgcnhx1gjdGuqt8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j0tKU2l2uamAtrLyHss4VwK6PUo6WrTYSeLWHCgud4GtKDrCmS8IcvjNZu1JmG7CHJw9HhRfTkTZTIQ+Bfk0nUba4reT9vimNslsApeK81OBe7hZ8likBptUH4jTWLrsQYVgc0hv/VkSnRhxVSQJL/qCdP9NXUUv3r5mRtcB/DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fBYnTb9D; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fBYnTb9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2b
	Ba3wtoNRLjMDEi0HU/7KGm7vUfMZYb8nXPrcEtw0U=; b=fBYnTb9DQbfLiRvFFT
	+teU5lRIV8kEnCdIjiCp4Ea1Hb81nUnZDEwP6pKMmBnTbL9fNKyWpPRJsemJv7w7
	0IAalFS6VAMoegbwUwqJkM5yJBIjVC953FUfE9LS8JqU4et9IyEgfLA0M4/P3U1U
	jD0R5STaEabuVKi5URcFbJjHY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXzbc8C+9pr+NbBg--.16S2;
	Mon, 27 Apr 2026 15:07:44 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/conexant: Fix missing error check for jack detection
Date: Mon, 27 Apr 2026 15:07:39 +0800
Message-Id: <20260427070739.133369-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDXzbc8C+9pr+NbBg--.16S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr47tF1kJr4ftr1xZrWkZwb_yoW8JrWxpr
	yDua4rK397W3yI9F4Utr1UW3WFkay8GF45J3y7tw1Yvr4Yqr1xXasFq34IgayxArZYkF12
	vF42qryUGF4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ztYLJbUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwApeGnvC0BRdAAA3G

From: wangdicheng <wangdicheng@kylinos.cn>

In cx_probe(), the return value of snd_hda_jack_detect_enable_callback()
is ignored. If this function fails (e.g., due to memory allocation
failure), the driver continues to probe, but the jack detection callback
will not be registered. This can lead to a kernel crash later when the
driver attempts to handle jack events or accesses the uninitialized
structure.

Check the return value and propagate the error to the probe caller.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 3a9717df39b4..4c01c6270bd3 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1190,7 +1190,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f86:
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
-		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		err = snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		if (err < 0)
+			goto error;
 		break;
 	}
 
-- 
2.25.1

