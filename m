Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29F3839A
	for <linux-sound@vger.kernel.org>; Sat, 13 Apr 2024 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713008594; cv=none; b=qVwtOqN5FvkY0c7lPbUI+CdKJMnVafpzW0acpOT1EUbTcQLQva9FPzqUNfSaHgxaXQ4A90rOvrzrf5c7+OaTNO7Wh2Q5bLF6xaNoIRK7yBzZPBFEGQyv9mdMwETDx6gE9D1pF48N9BX3HoAg+pJtyq7/zmvhUmDN0vs4T3248iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713008594; c=relaxed/simple;
	bh=S5SKxjqBLEazmK9VzoxpMLNUbW254TmsbmfvUiZKfkU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pilZmw2tznWEkNcF9EoPT9ZDuWMw5jJaks0y63Nfg3Go2yCPvaCLnrn+cclKmAMSWP0SWn0vxiJox2S4BEBGSfMKkrzV9QExT1UCivfPZeukbuTvRMdYWqRImJdAjE25G+Nzh8uJH8eZbO4n+z/7rT0ZBNjXjIMIMLUx4l2G+HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bYJMRn00; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bYJMRn00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1713008583; bh=buU/TI1ycm4oXmFV2yW1Moaxa/OBm98bV+Uw5KNRXxo=;
	h=From:To:Cc:Subject:Date;
	b=bYJMRn00I4nRCa+AIH7I1bch6+LHhqYLQ0ygD7voZSKk70F6BalU0pmenCuXxKutg
	 dPVXm7Nh3qd+RTCRUHMsYN+Nv0LTjZFlfrV0oNXECwSGQcq1RCQmlACznMqHfDIqG1
	 6zMRWZ/JuzqV+dBgfc6mZxIY/A0SMEj1B739m1po=
Received: from levi-pc.. ([61.186.29.10])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 92D1C830; Sat, 13 Apr 2024 19:36:45 +0800
X-QQ-mid: xmsmtpt1713008205tvbhjow7w
Message-ID: <tencent_1FEC358E200042A50F654401EFAF6CDE3005@qq.com>
X-QQ-XMAILINFO: MfjpfBJIjGEYyQKna3BycqEjkVrbFg70sO1ENcrfb/jTGQFVo+L++lpRLjtdxr
	 2THWD93pMZrYfKD+bj263CqkpKrELKL4Z9le+Vxa5WBMfYanifFP3N6xYlLZejCaJsdRFL4x08UT
	 9wx+DOI4+b0fjnPiH+/B7rr2VL8AMm9nQUi0CDjPudvEOjwaQj90OPooOpfnEwA+ayJqxxNxutFm
	 afKLRBx3yHTfau9dVf8sr9hrJcMxqj8Gq584HKr4u3Mysa0ct5KTbVXwJO4U7dltRyeWFpt8KET6
	 SfZNYavL4j6x33scooQiQnVQLwFzURH0wNvJFB9Cz3GLJBZfLCmpaxEl+1V+D6iEIEV4Rgv6UeJh
	 d3qvSbwKKvPB5DQBgGCOVUQbBdgGZBjq9A2CO7lwC1ZZieQ2lv9KXXpvf/Os8WKnEetpmSNdyKMV
	 8WEjB+Kj7hbgQgx+3nO+qKM8JvzBVCXOKu2xThcbjPWBOQluZFwsArYhocW9V4YXyoKsaO0T21ZZ
	 RDCj+5Ye1CdxYLi+gpbsfmppd+rJwjPm8/BOmhtYZdPB3ONzRfilgPYMZqal4PboK/vayrRdT2xD
	 6BkLNFMgVyGqvxw2hPnzGGIqNihea/zgPzHtcyvGyXaCEznvXj5rP1Jqe5dmCIYB5aJxQ3Xl8nvK
	 SpyXsNF0b4/uOh/dvp9O6OqnTUUO4FmJAb9QXvtq3P8DBbfCju/lu9KIitznMOKzLXaQTGJhW1qX
	 El0zmtWycZSthJm310Hvp5m7I/1vh9u2z+KgE8AfkaxTD0uwMWe+CLaPH/Rgf3T4R9BiOEFBRNZu
	 3DZCN4PxS/nzmin5YTP22Shq1MNHJfyWOaka6O5uByKK1YPxVxu3LcyiaS2RXuI/j8d8W9mLTv34
	 WxW1M+8tvxHdNlx5TajbGjsOMSWQTUFb0V1fudts+UV5VaXI+8FLtH1D4vzARShJSYuA9qP/CxWq
	 pTio/BPhWGR3n/Hxo7kEO3QFAUd3QsW9Saq2KPIHHC6D7terZVJdyexZu5qHxR0NfsTJqFz1hXZR
	 2OkoaxQUR9NvLj4x6mPmm0lHKJ9yG6ArGGw6hbmEd1WqmXhaqTz2bEi+94h/beTxT+AbtjfXUR1I
	 Nsiqyp7fHofSqKvFqnqnOHtx4goA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: zhanghuayu1233@qq.com
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	zhanghuayu.dev@gmail.com,
	zhanghuayu1233@qq.com
Subject: [PATCH] Fix volumn control of ThinkBook 16P Gen4
Date: Sat, 13 Apr 2024 19:36:54 +0800
X-OQ-MSGID: <20240413113654.22769-1-zhanghuayu1233@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Huayu Zhang <zhanghuayu1233@qq.com>

change HDA & AMP configuration from ALC287_FIXUP_CS35L41_I2C_2 to
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD for ThinkBook 16P Gen4 models to fix volumn
control issue (cannot fully mute).

Signed-off-by: Huayu Zhang <zhanghuayu1233@qq.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d6940bc4ec39..1aef223307bb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10396,8 +10396,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

