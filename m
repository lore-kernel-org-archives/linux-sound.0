Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967986;
	b=jfb0Yb+jzYv6ltfARp5xu9AbD7um7M8Y9nwwhHNht5iZh+i9kNSitmUsZcFjz56wc1n3
	 Q5yvXb0OpiVPy6v60gB/0eNXlHsCqFQnO9g/alNjHTfecOd+VOPNzfbsavf+Owg91oTW0
	 BeQGdwJqwthsgk+JgnoE2ZPN59G7ca6Zv1BNj8PcF+7g8uhFwuUtNKZIky7C7USgHzzTA
	 oF8fyYV63fShwlgWHHcBf0yQpQWYjErGkB+g13zrtulvrHrHVlFTXmEcmgnYwJ6EhiWw4
	 8BbxhYuNxcgkOpY4GBxqlVmE5lwJ/urWqzkVAQn46Ltr/DInVxpInXanfexCb+cN98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967986;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=mRNuHTjUB/iNUU97L3XWyycg2VE/cf7Y/cdjhsJvUAE=;
	b=3pcXonvKNnlE3uK41voc3U+DCDTkqI+BLhyYESngN6t2CHMdUs2di6k+cft0fKG1wboo
	 7pGSj5c1FWx9DJR7m8N8WdxWxIzP/KpSUA94XwMMFN/+ssg3R9VRpU7UeeJ5nMYaJIOpl
	 lD9VmiHuP8vzExxdr7jmCqrkrUd/LRFIFJnSIsuj5cBIaQMH75VqH7aUxeNxU/4JRtM0w
	 9b2F76F/5smCIEDuCJl6thLO/TZ4/tMLpSV5Cp/GPN93C9nF//8M8Nc90282S38efRd2X
	 9xZ6Taq5F91cu2iGGtdF3dDKCG1AUVdhdk0I7ha7+hEqB71g7WvDFgtWhBJh9lFEWSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=FOk4hmD8;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C095606A339;
	Wed, 18 Nov 2026 02:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C095606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=FOk4hmD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794967917;
	bh=mRNuHTjUB/iNUU97L3XWyycg2VE/cf7Y/cdjhsJvUAE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FOk4hmD8Ho5a5CpryXGuuOtFLt9DomAduuX+CEaahdKFVv/uuHHV2BHHRjnxL7un9
	 902vrgMcWLXceeNhUINwd07bbcB6huS06nEvTHVD4+q/pm+VE7T6t8D29XLdav4QMh
	 JXXzMsEU8zIRUyXKbkokKaD561arrJ0PM6xgbTpI=
X-QQ-mid: zesmtpgz3t1794967897tff7fcca9
X-QQ-Originating-IP: /9n/i4Z4fIqaxcOyWoZQwokUXFfN9KtgKwsjJ7BKWTc=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 10:11:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9738446664917518319
EX-QQ-RecipientCnt: 8
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: da7213: Disable runtime PM on component registration failure
Date: Wed, 18 Nov 2026 10:11:34 +0800
Message-ID: <0D45FEC273BAD5EF+20261118021134.3827729-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OW3qjH3bC/TAyLeHNXiiaKEha4TLGuex+xLvGy94q8NR21QEgLxEcUkf
	egkGHCQsZBBpMv9pw8vowe2zG4HMu5eHSaX7fgitEj2rQyKikeCtS03ybpJrjvBRjkOrqd6
	eFLZQeHuC/AGG7nka6aBZoCdTzJ4fO9q10IEFcv+1gbNhtSK3FMg3tOj7AW8Xm5fwI0L0G/
	0fhlVIL37wtKAfGxNODA1eeTjgbC+g+6ZVJ5u3jbs+uA5PguchsA17+nq7B3JkWTtfw8Qn+
	dF6Q5oKanYA2eY/ecYIKnBW8kzXN/eTzi1YOnNHyVymzXps7D+QYd1DCwsE/eh32oWYQfrE
	4pv8avpMoc+1H5KTBuKy9IPAFrpFFzrNgPFeBC1A0sxn6jtCxd157Dld0UVXKRUibDv1HwQ
	osqn8P1Bfbe8FBE/zBDEF4p53ojAUjaqR88qETVtmI/tjXUu/zyARk8T/ndIwCyA2/KMnm0
	L4762IdkOkzEAEufJ7vvjI70ry+3sw77gE6QT5xPeNUUUI7mUp4moSBjm/K+p8HqP7vEk3i
	dDE+m06neahowkzlITrMxkaTlwT2OmAmeEbgtMks70Zgvfib2SbmAYzuXOAlRSLjEselRGs
	YtCuPqlARs/LI0b7vmOlRLAaJJYGanbKrL1X3YSkUgCR9EYnwBhs5PiAyxmwZyR+vI1VcjB
	adZrHigMZW5al8oMsCFBWyJClQlevLIJvZxqoAbbrhnGSTzJLAQEarXYVW6L0TmJCTuyv2z
	rWwHdSB5ANJCR5UKeaCDmXilyKCojpYUE4aTd1rHK08B6RGaGcBnsMLzZV5CxlSGl/7rFjt
	LRmql4ZoyRsVC2fw/CjrXtfMi/wLiLnmeGNv9QWlqc7LTlSv8cVbsSMMMQsxC4bb3gLvt0P
	S9yFxastzfu2i3izf6oURLyLRs903j5atCt3r46JZ1PTEeooEMInB4RIw3cnXB8OGH24WIB
	5Zx8qEcENlLUSQkOu0hi57ZJ9NleaO2p/oLhi8VjJSSmL7JrAvOQgAVCGxpa6X47OVq4BbE
	dKtGAPkTatRPzukoWrFur2xX57YkehyYFIXFaetA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The probe function enables runtime PM before registering the ASoC
component. If component registration fails, it returns the error without
disabling runtime PM. The remove callback is not called for a failed
probe, so runtime PM remains enabled while devres releases the regmap and
powers off the supplies.

Disable runtime PM on component registration failure before returning the
error and allowing the managed resources to be released.

Fixes: b2a378816d0f ("ASoC: da7213: Add regulator support")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/da7213.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index b08e8ab6b421..53ed58ca9ab2 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2242,6 +2242,7 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 	if (ret < 0) {
 		dev_err(&i2c->dev, "Failed to register da7213 component: %d\n",
 			ret);
+		pm_runtime_disable(&i2c->dev);
 	}
 	return ret;
 }
-- 
2.50.1

