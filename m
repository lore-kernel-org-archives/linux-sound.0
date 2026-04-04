Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275BA1D5CC6
	for <linux-sound@vger.kernel.org>; Sat,  4 Apr 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775314071; cv=none; b=Oq4cnSNH8zCNd8xGdHzS0E93dAHI78iXCoa5rDS2riwZ+D/BpUYIj3jwXjhodtMG74+QPXIWowI0MBEUaJm+uSN/cXFx1tyzIKpUwx+s5s4AH63wCElQkjVxBt9bzBCA2kVTEKGyPhUQJdK9oyc56+NwRcYspcE6ApUBLKgNwao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775314071; c=relaxed/simple;
	bh=vttIhjz66r8VbEAeWs/fzUI7nGNb/NOdrHrhDFzc6g4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JBjuV9HOSNU4KlZBUeKUvHPZqbAcIkh2rcG6P6IjIcrq9hCJdWUyDkOTE3w5qsL8ehL7ZwAKjavzllunem4ykZM1bZOTxP5jGsk6ql3mkHQ4mE8g9yMrtMkVw8aSAR3dNgDHsFn9tO7u6bgTy+gJnbc1Hy26hRVzP+J76onBPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nevaberry.com; spf=pass smtp.mailfrom=fe-bounces.nevaberry.com; dkim=pass (2048-bit key) header.d=nevaberry.com header.i=@nevaberry.com header.b=KcCq8R7/; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nevaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.nevaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nevaberry.com header.i=@nevaberry.com header.b="KcCq8R7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nevaberry.com;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From; q=dns/txt; s=fe-e0344519bf; t=1775314069;
 bh=9Vsa2YCH+T/th8NGafgLRAKj8dSt+rjCMpC4uqVV6eU=;
 b=KcCq8R7/kuXjNJ9OmaM1gsiWwC4SRljkG/qCaicbZ6psk7DC0s3f75N6eNo/NOKFEHWaJHvnu
 bFpUQCvUM9uAFJ4o5XhAWSlcKxpzS8lSnVWbRaIrRBZxHDB+utOjCLP1LMzMOAUzTqCkCwAV2Ke
 a+L3KsQJKEnY8NyEbI5nYDOctBWEKl6kuIagQ728TBwvjAGzdlblAZL/AOa3tXydKNeJSqn3RSo
 71SCr2mHDvww7A82kXUxr8Ru/zJiGbf76nZ45sfXQai60JrDn6NeCxs7UJrfsTMFumnVBAWzc4+
 BBRLPSpKuNe6yCuFu52uWNDFvA6ElcbM9Te1j/gY9tVQ==
X-Forward-Email-ID: 69d12493dfb87b389df7cb68
X-Forward-Email-Sender: rfc822; antti@nevaberry.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.6.68
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: =?UTF-8?q?Antti=20Jalom=C3=A4ki?= <antti@nevaberry.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	antti@nevaberry.com
Subject: [PATCH] ALSA: hda: intel-dsp-config: Force legacy HDA on Lenovo ThinkPad X1 Yoga Gen 5
Date: Sat,  4 Apr 2026 17:47:43 +0300
Message-ID: <20260404144743.46466-1-antti@nevaberry.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SOF driver fails to initialize on the Lenovo ThinkPad X1 Yoga Gen 5
with Intel Comet Lake PCH-LP cAVS [8086:02c8]. Add a DMI quirk to force
legacy HDA driver selection for this device.

Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1120554
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2455066
Signed-off-by: Antti Jalomäki <antti@nevaberry.com>
---
 sound/hda/core/intel-dsp-config.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
index f0a44fd11..179fe4d59 100644
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -269,6 +269,21 @@ static const struct config_entry config_table[] = {
 		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
 		.codec_hid =  &essx_83x6,
 	},
+	{
+		.flags = 0,
+		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Lenovo ThinkPad X1 Yoga Gen 5",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+					DMI_MATCH(DMI_PRODUCT_FAMILY,
+						  "ThinkPad X1 Yoga Gen 5"),
+				},
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,

base-commit: 9f2a23bd5d30dc0968e56a2b6e5edb58aff1bc6d
-- 
2.53.0

