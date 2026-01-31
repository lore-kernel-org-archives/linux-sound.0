Received: from cvsmtppost104.wmail.worksmobile.com (cvsmtppost104.wmail.worksmobile.com [125.209.209.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DAA1A9F97
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.209.209.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872813; cv=none; b=iRJWGPdCaA1+B1k8rsx5uzMnsHb39JqVqR0Iq+VvP5HUf3uH5fLvrl7+4XIhbxgbcDbfXTapfRC13fcY1SRB4CgBd3bnyPjeiVmZ00AnmNyrbsIk+AIjd68rGwpjZyBTBD4mzhJbY7IYq9mhdFSfYnmptlTRtzzsrvGBrjFOKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872813; c=relaxed/simple;
	bh=E82sTNegUBXg2LRhC+1U57IlPF+U7zgteV10qG6IMmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EeR9PDXKeaF+sWlCmEJBRl56LSnyZKuGRknosfQ71ALOup2PPNdqBzzaPM27e/4i0ecnzapV1GFgX1lcprPvNmdwzAQrFeNtrg4RpM9Tjad3UHjt8sLBQovAjyi6jvkk8yLl5CgS5QsMggwj5kvz/rhnUFvf/uIIDxVQDgEZScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b=QQ+G8C+O; dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=Zh4AKYHt; arc=none smtp.client-ip=125.209.209.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b="QQ+G8C+O";
	dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="Zh4AKYHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1769872202;
	bh=E82sTNegUBXg2LRhC+1U57IlPF+U7zgteV10qG6IMmI=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=QQ+G8C+OJH4bUSFTjqyFAIx94KwXE34y8JL7t6Yh9wFS/3i/Qf3aApC0yoG3vSN53
	 CtAxiphX1M2aZDFas53BWzg+jrhJc29wu0gNKHrRTYKTE3PXs+Q0RKEf4CcXfHsXTH
	 DTwSkxW6Kv6LjjZ+XgwgPe6e11iiw+HFOAigto/jVi4Id2cOS46Ma6gY4UJQUek7JY
	 uCak1qz8SlV7XLxSRaFKhvAdIuIJOMVBavF7ytNWiL9Udyg96FW1efB0FD3STIWorg
	 ELyznwKYf7xxCzgVQFKpB2xtQUI7xg2goigBFAZSH1X5EwExCJ7okqEDZCpANUhrbl
	 WJHo72+4rP8dA==
Received: from cvsendbo003.wmail ([10.113.20.165])
  by cvsmtppost104.wmail.worksmobile.com with ESMTP id 0Vf5DNdtTiO52XMczF1taw
  for <linux-sound@vger.kernel.org>;
  Sat, 31 Jan 2026 15:10:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1769872202;
	bh=E82sTNegUBXg2LRhC+1U57IlPF+U7zgteV10qG6IMmI=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Zh4AKYHtN2lhgsKes1CLw7O4SU3GvGu93jzEcsr6WiFoWeubohvST8ltP/EvndeP2
	 /aQhg5Hj4hA0QIkyPfQvlsgkXKteGpwA8LWG27TPzLUdzfMIIw5BBG79Ils7ubr4A4
	 3V/JOqXdvs5u4RxPYkieATYqHNhuqABziRsK7gE8=
X-Session-ID: LxXa0j-aTlCiSz4T7TLToQ
X-Works-Send-Opt: 6en9jAJYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: VqYqaAvrFqJZ+HmZKA2l+6E=
Received: from s2lab05.. ([163.152.163.130])
  by cvnsmtp104.wmail.worksmobile.com with ESMTP id LxXa0j-aTlCiSz4T7TLToQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 15:10:02 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [Question] Dead code in snd_soc_dapm_del_routes()?
Date: Sun,  1 Feb 2026 00:10:01 +0900
Message-Id: <20260131151001.3296905-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I noticed that in sound/soc/soc-dapm.c, the function
snd_soc_dapm_del_routes() always returns 0.

The function (at line 3272) simply performs:
  - snd_soc_dapm_mutex_lock(dapm)
  - for loop calling snd_soc_dapm_del_route()
  - snd_soc_dapm_mutex_unlock(dapm)
  - return 0

However, in sound/soc/codecs/tlv320aic31xx.c, the return value
is checked and there is error handling (at lines 1044-1052):

  ret = snd_soc_dapm_del_routes(dapm, common31xx_cm_audio_map,
                                ARRAY_SIZE(common31xx_cm_audio_map));
  if (!ret && !(aic31xx->codec_type & DAC31XX_BIT))
      ret = snd_soc_dapm_del_routes(dapm,
                      aic31xx_cm_audio_map,
                      ARRAY_SIZE(aic31xx_cm_audio_map));

  if (ret)
      return ret;

Since snd_soc_dapm_del_routes() never fails, this error path
appears to be dead code.

Is this intentional defensive coding for potential future changes,
or could this be cleaned up by making the function return void?

Thanks,
Ingyu Jang
