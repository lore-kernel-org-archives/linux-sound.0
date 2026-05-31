Received: from mail.sntiq.com (mail.sntiq.com [45.149.154.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10191223DC6;
	Sun, 31 May 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.149.154.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780264057; cv=none; b=W4uop0YhFbOV0OMDNGNKkmVVcFHRjkX7mb4+NxYmxFdblfBJYqtW9uCMhqGcYOxonZxuRJzxioN2+Ndvyc/5z5ozX570Faei8QjkruzM0SuTu4HgCweF+rUJQ2NU6rRn7C4dzhEA7+mtNM1qOoNn2JcGTccCyNlMVqNBdn7ulCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780264057; c=relaxed/simple;
	bh=dylDLXITWtxY3thMnS9UBRLpSS5EbKrJlDdBjrjoOTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZjnWq9sgosFDJjuqDTFxHkr30azrp+6am7ijv57DKQK7l8SRCA5m5GLEuQu5yCGuvYUnW4iW5hzHQKu0kaj4qECijmLrmx6KOIfDF0aHUU6+mPWYUhhsSKPkI7P9FrzIC6XfIYS6eesgESwN/QMEKYECCr7O9/HppxPTQXQiFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntiq.com; spf=pass smtp.mailfrom=sntiq.com; dkim=pass (2048-bit key) header.d=sntiq.com header.i=@sntiq.com header.b=BZJpN+JT; arc=none smtp.client-ip=45.149.154.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntiq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntiq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntiq.com header.i=@sntiq.com header.b="BZJpN+JT"
Received: from node (unknown [209.198.153.231])
	by mail.sntiq.com (Postfix) with ESMTPSA id 7A863801E6;
	Sun, 31 May 2026 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sntiq.com; s=dkim;
	t=1780264047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aWDp11wAt/lRpmd9CxGEjDtYYesw2LjIYL33qTmM+gE=;
	b=BZJpN+JTBMdMtjGmAO1hmbnizWal51ihuf5B8Vyui9euZJ6f3bd6I1+NJebMXNxnNSs7BH
	wVC9wquqUqK76Y3eP/79m7CvLlrJd1EZ/uwZpE1bdOr1VvLz6U90tsD7kDWEH8vEUdgweu
	pLVbK70dBGsN7ZD4l2uNogKj3wm7rW6CihIY4770A2kZlDTfgv4rBHGGCZDPz+R5ux4nbz
	oXqJX+7lb8O/oEPbzJ4Z3jv3KPm7SEt2W3CV4feJnPUm6kobKolKfpVaXl/S5Pfh9N7wGz
	YswfrbvY+nBGghLjzQnSgqQ1uUhmvNTr+fwrcJHYVr4JMqSce3kd/QtjKsFQBQ==
From: David Glushkov <david.glushkov@sntiq.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add MSI Raider A18 HX A9WJG to quirk table
Date: Sun, 31 May 2026 23:45:12 +0200
Message-ID: <20260531214512.170716-1-david.glushkov@sntiq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSI Raider A18 HX A9WJG has an internal digital microphone
connected through AMD ACP6x, but this machine does not expose the
AcpDmicConnected ACPI property, so acp_yc_mach does not bind.

Add a DMI quirk for this model.

This was tested on an MSI Raider A18 HX A9WJG with board MS-182L,
BIOS E182LAMS.31A, AMD ACP6x rev 0x62, and Realtek ALC274. After
applying the quirk, the internal microphone appears as an acp6x DMIC
capture device and records correctly.

Signed-off-by: David Glushkov <david.glushkov@sntiq.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7a637d6..39c2aff 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -521,6 +521,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WHG"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Raider A18 HX A9WJG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.54.0

