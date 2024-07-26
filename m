Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C323A8
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006694; cv=none; b=rO868qTkTJs5VTz/kRvYnu006Zm9t2aV8O6mfrZDHYY2oQkT+0QQRPQ2qBvLNwgyVEDzou8fpkxqOabHQDg27bzyQgmouS1u/UuVtWKqDnkc0YA5Z29JKB4fZ+szm481KIDfoSpbX+NJVR2Y3jXtpaCS/eCll9qw4CEc1U86t48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006694; c=relaxed/simple;
	bh=R8pLKYxeT7P2Ua1fP1XL+qzWt5ru5NF3/nQl7I1LkwI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FK2ujP3Zzt6U9CkEl+dk/RHLX8LboZAgg+6oyijGQIaQYbeqjAM/SCfBgk3bwydbJCWTLd0KUxABzFv+nZtobzBKOYkI+KzDZ2DzXM+NqmsQSZtQQQoM6d5snukp3fV2gje/KeFnqGVqWnkmMvemjnLsI08J7LnpexCo4qVwS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NU9YWhua; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NU9YWhua"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q3vr9V021428;
	Fri, 26 Jul 2024 10:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ldo6rWTGUHueDfmK
	AxJddl6iNyyQdtC0KcKIzOrjF98=; b=NU9YWhuar37WcnIgkHYE2xCiT6PHvi6W
	7ldvpQbPOBY18B0M93CZ4NWBAVVggkLHDYQvf6SPg8VRsCfUPi1Hsbqy1pSHYMkv
	qP6PfUD9ir6DZEaD/+uQssLvi0bDQk6mUWaH559eyESyUX9zZ+ZTe9x7hhIjBDyp
	kae9sWee8vg+dmz8VmbSOUmsEkMb996zF+x6HV6eO+dSfHZkHRC8zI7YyP9+Bg15
	3jFMS3aCh9WJnZCF3nGlC9vnjmrKAbgIeZncvkg9m3J1Ydu+pBLOqiXoRQIvOgFa
	oqLUymFeSIegEYzRrx4lkVdkeOrlJpGUwmhzlD3rtNULXBMOrdKF7w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40m1tqgn52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 10:11:21 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 16:11:19 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 26 Jul 2024 16:11:19 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E4EA8820244;
	Fri, 26 Jul 2024 15:11:18 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH RESEND] ASoC: cs530x: Change IN HPF Select kcontrol name
Date: Fri, 26 Jul 2024 10:11:11 -0500
Message-ID: <20240726151111.3247774-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: X5qeCzaYHBnYJgMvW7k0RFT8clhAlH2Y
X-Proofpoint-ORIG-GUID: X5qeCzaYHBnYJgMvW7k0RFT8clhAlH2Y
X-Proofpoint-Spam-Reason: safe

Change to the IN HPF Select kcontrol to the correct name
IN DEC Filter Select.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 sound/soc/codecs/cs530x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 25a86a32e936..da52afe56c3c 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -129,16 +129,16 @@ static int cs530x_put_volsw_vu(struct snd_kcontrol *kcontrol,
 
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1270, 50, 0);
 
-static const char * const cs530x_in_hpf_text[] = {
+static const char * const cs530x_in_filter_text[] = {
 	"Min Phase Slow Roll-off",
 	"Min Phase Fast Roll-off",
 	"Linear Phase Slow Roll-off",
 	"Linear Phase Fast Roll-off",
 };
 
-static SOC_ENUM_SINGLE_DECL(cs530x_in_hpf_enum, CS530X_IN_FILTER,
+static SOC_ENUM_SINGLE_DECL(cs530x_in_filter_enum, CS530X_IN_FILTER,
 			    CS530X_IN_FILTER_SHIFT,
-			    cs530x_in_hpf_text);
+			    cs530x_in_filter_text);
 
 static const char * const cs530x_in_4ch_sum_text[] = {
 	"None",
@@ -189,7 +189,7 @@ SOC_SINGLE_EXT_TLV("IN1 Volume", CS530X_IN_VOL_CTRL1_0, 0, 255, 1,
 SOC_SINGLE_EXT_TLV("IN2 Volume", CS530X_IN_VOL_CTRL1_1, 0, 255, 1,
 		    snd_soc_get_volsw, cs530x_put_volsw_vu, in_vol_tlv),
 
-SOC_ENUM("IN HPF Select", cs530x_in_hpf_enum),
+SOC_ENUM("IN DEC Filter Select", cs530x_in_filter_enum),
 SOC_ENUM("Input Ramp Up", cs530x_ramp_inc_enum),
 SOC_ENUM("Input Ramp Down", cs530x_ramp_dec_enum),
 
-- 
2.34.1

