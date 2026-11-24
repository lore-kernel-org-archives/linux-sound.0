Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.69.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526765;
	b=uIOCs0baePR3iq0Sti39USDYKeEQ18/8/y8hRGuQbm1DQvUcB85LSUK/alSGnFN0vQgA
	 CqjYZUMG762b4ny4dvWW3GSZsIPKLyKXo+EeXFnfTrhVEtKaonOMc8MH1bbtv6rR4A7Id
	 Ks2psBogHe+PjKE+y/vdl2W2tW/wuMU6mEQMIv410ochmEHVQ+FaCM062FszKt3h5dQlz
	 3DyksgUv/uP6eoaeIzIZsJqMnkwL196wdaceNC46T1jOOR1IKfWvHppmlDHfVHNi9pM0X
	 Y1hmPDs/SUCy3dgbHujZ56LjCXbfilskq40b4lqlQ0HSrlET/uz1iG0/koyVX6esAvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526765;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=qGtfw2huY2PhcvzQh0C8yyVH9iIPFGV4TgiUEeaQBVw=;
	b=mW2zdcoeUlhic6gnNpD5wPfK6UIDnE464DRKZ16V0r4YVFLDHFvX1mY9FWwx4+3kyKtr
	 qQKiISLTtZmIflJQh58UnfZtjEwE7ZWY13F3OXzGZhA4hVSepcmJ1yuiWIBFK13Ny5kyj
	 uTzYBbC14HsWpt4vBRiTFQP2Ceb6bdrf5D4XwS5/Y18bQ/Gptj6N/K8xXEo6YdTch3P4B
	 gfWBpRxE1zSZCY0uwbnOLlcLPnnkeWk0+mf+OmhpVJ0ZlkZBl+jedREAybeZfjb9Q4J8W
	 ngVUoRA+DakqPX5LsWRmLx2Ej5ZBubXlE9MY4xW8lZbij7SUB6C3kEhYJZ2pAhPcekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ynnk.dev;
	spf=pass smtp.mailfrom=ynnk.dev;
	dkim=pass header.d=ynnk.dev header.i=@ynnk.dev header.a=rsa-sha256 header.s=sig1 header.b=FnqyBRUg;
	arc=none smtp.remote-ip=57.103.69.222
Received: from outbound.mr.icloud.com (mr-2004h-snip4-1.eps.apple.com [57.103.69.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969EC606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ynnk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ynnk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ynnk.dev header.i=@ynnk.dev header.a=rsa-sha256 header.s=sig1 header.b=FnqyBRUg
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id 4A22E1805103;
	Tue, 24 Nov 2026 13:26:03 +0000 (UTC)
X-ICL-RepId: 01a20dbc-22ef-7231-b128-9ac6a16df8df
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynnk.dev; s=sig1; t=1795526764; x=1827062764; bh=qGtfw2huY2PhcvzQh0C8yyVH9iIPFGV4TgiUEeaQBVw=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=FnqyBRUgk9Y9uZjmkcRY4lbkvF6soICXhyEXjF7MqoPinbTJDQ9Ykr0qNHbHbEG/3okmFp0Wb1MrZ9XzW83qEfpJy4j28wsf9SUp/ug8e1VN/YIbwWoeda6ag2Md0UJrAnoTvdXfTfM9fNrPazy2WENNkxhdB5lPtUANPXVu2qM0lD23EIor9O4FthCAJWl4RsetqfCNPIjXGCbjUWhuZXcLbWlJRHAuKwjk97WG+BnsYB3L/WsOsdWSfERIcd3xa7ZNKLFv3OjPLwgLYNDkg1KhgdDXFuKzIdDHMA3kHWy9fHgzJEMTbChZMt6hyrx01I64EzBZXssIKKtqTX4lFg==
mail-alias-created-date: 1686161252489
Received: from notyourlaptop.clients.bit.guest.onway.cloud (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id CAD0C1802D5F;
	Tue, 24 Nov 2026 13:26:01 +0000 (UTC)
From: =?UTF-8?q?Yannick=20M=C3=BCller?= <mail@ynnk.dev>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Yannick=20M=C3=BCller?= <mail@ynnk.dev>
Subject: [PATCH 1/2] ALSA: usb-audio: Limit the depth of the clock topology walk
Date: Tue, 24 Nov 2026 14:25:50 +0100
Message-ID: <20261124132551.137134-2-mail@ynnk.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124132551.137134-1-mail@ynnk.dev>
References: <20261124132551.137134-1-mail@ynnk.dev>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX+jB4pPU4mGGa
 FGUWxpHrmignvhT9IaE2g06tYW9/e1TjDywJvdYjb5ERRga0we7L5URGLDBOx0TyfMdJ9EosIgl
 PqzHBqAHhCDWc1av9PDzUBREcpgqbq/6vvtMqFKHKx1rF9l7RR0omCy3/Vg+z6Z5UAgNbVnFUbK
 M+9LoJdcWAgPvGpQbQtqo7fFalEGG6kVKdrgOkxEbiJEPFBpDeVlno2y4dJZthSvUxfscVjzXNy
 RUD/zInFv8hMfurhWOog19bGJNtNF3qFfC0tFPtQVJ0+hhpoleCl6a2AevJVTCjqesmSpS3N2F5
 g+4CGNaUhN6Xucs/kbF0LcOlJZ3prcspXPrd2WWC0uUzjQEp78UPvsGNPqyOuQ=
X-Authority-Info-Out: v=2.4 cv=YYQodARf c=1 sm=1 tr=0 ts=6b05906b
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=wbbCu9YnSpm8ZdSLOl1R:22
 a=AAKO-It69yxVJjVG_j8g:22 a=0BAdVAwEvEBWvlTRiyIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aRzoz-pe4oO-fyCv6txTo2UHbl5k6L0P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfXw3mXw56k3PLS
 BkrWFvKSgl1M36xsxxZ3q6pua9cxidO4uLPXMoPbAasOI4bdY3mxofTrk69cdYsjQYf/qQa9uMB
 OmbKyiom2u1ZIjBsIASIaNW/GXlRq8g=
X-Proofpoint-ORIG-GUID: aRzoz-pe4oO-fyCv6txTo2UHbl5k6L0P
X-JNJ: AAAAAAABpmedamBP5vP3PiozC+zuOHkS/NaAZ/lJwAshonmsJR8Er45tb/pk9r5IYM2VEM
 ElBLkX1bl7la+w9jUfIkETRdFqpP9vk20JT5ULMtnufWg2AxifKNvEhVe3X654dTAJ4DnE
 WwixM+Ha6Tyzumbd9cIOj2/SRGQlV3AGer/pPVJIG4IckGRtP5RxqhnW1qIIpn42w8RcB5
 MFU6NL59xTGmtAaeJkFiOxVpPrvemBJpFoUiVINCy9tsltvBeu372xGD/XvFp35SRh68PL
 suUgUb8qp5G6DINaD/V0Jh4KxhjdxyQfJUtb2KcadNZM/eiGvRVM03vgMhyIG5NKCvtARd
 q3K3xCYNfSuDTBCO6S/xT4Pfx9fWSmUGoxe3yfxy0uAHK1gfRmWlCAQpMPJ8TlQAVT0ZXb
 LHtAlh8C9EMJgniTRn0oyH7plNT5sOoks/LyIcMdwU4an1cyOZTSVmUA/Bjf1rayHrAL9x
 0s9j8O8f1XVC29etbI1u/WL1JNwTvH9iEAwLbCO+P15gQG3GnxLDnuh5OxlTC2ZMhm7bvO
 akUQ1JBqDLNdfA1kWRzHVBk5M9oMumnpXaahBrJRwznOU1C4/MIa/T3rVENdh7r4banMDD
 3I992AzoGImhTjeMH6LYPROGr1B6i7VyT8NTPyIkyOlXNCHGq1QKuZM0u7JVVsSO5ezAsP
 TNp3HZAqSV4TprUgWpLYqpp67P/yLYPEXKWwJJEOom1bJX17clsDz7KcpoNRWq8U6FbNA2
 hi2x8YLpblzoSq4cQJu5TA4g6L2An5sg6rKeeULcXf82z5nxtHwjK7AbQbBpVRbGRvpJam
 8gSI/FwLGA==

__uac_clock_find_source() recurses through clock selectors and
multipliers using entity IDs from the device's descriptors. The
visited bitmap stops loops, but a device can still chain up to 255
distinct clock entities. At about 96 bytes of stack per nested call
(x86-64, gcc 14) that is roughly 24 KB on a 16 KB kernel stack, so
a device with crafted descriptors can overflow it.

Pass the nesting depth down and fail with -EINVAL beyond 16 levels.

Signed-off-by: Yannick Müller <mail@ynnk.dev>
---
 sound/usb/clock.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index cc77eace7b59..74f9923e5015 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -292,9 +292,12 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 		return uac_clock_source_is_valid_quirk(chip, fmt, source_id);
 }
 
+#define MAX_CLOCK_DEPTH	16
+
 static int __uac_clock_find_source(struct snd_usb_audio *chip,
 				   const struct audioformat *fmt, int entity_id,
-				   unsigned long *visited, bool validate)
+				   unsigned long *visited, bool validate,
+				   int depth)
 {
 	union uac23_clock_source_desc *source;
 	union uac23_clock_selector_desc *selector;
@@ -307,6 +310,13 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 
 	entity_id &= 0xff;
 
+	if (depth >= MAX_CLOCK_DEPTH) {
+		usb_audio_warn(chip,
+			 "%s(): clock topology is too deep, id %d.\n",
+			 __func__, entity_id);
+		return -EINVAL;
+	}
+
 	if (test_and_set_bit(entity_id, visited)) {
 		usb_audio_warn(chip,
 			 "%s(): recursive clock topology detected, id %d.\n",
@@ -381,7 +391,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		cur = ret;
 		ret = __uac_clock_find_source(chip, fmt,
 					      sources[ret - 1],
-					      visited, validate);
+					      visited, validate, depth + 1);
 		if (ret > 0) {
 			/* Skip setting clock selector again for some devices */
 			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR ||
@@ -414,7 +424,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 
 			ret = __uac_clock_find_source(chip, fmt,
 						      sources[i - 1],
-						      visited, true);
+						      visited, true, depth + 1);
 			if (ret < 0)
 				continue;
 
@@ -436,7 +446,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	if (multiplier)
 		return __uac_clock_find_source(chip, fmt,
 					       GET_VAL(multiplier, proto, bCSourceID),
-					       visited, validate);
+					       visited, validate, depth + 1);
 
 	return -EINVAL;
 }
@@ -462,7 +472,7 @@ int snd_usb_clock_find_source(struct snd_usb_audio *chip,
 	case UAC_VERSION_2:
 	case UAC_VERSION_3:
 		return __uac_clock_find_source(chip, fmt, fmt->clock, visited,
-					       validate);
+					       validate, 0);
 	default:
 		return -EINVAL;
 	}
-- 
2.47.3

