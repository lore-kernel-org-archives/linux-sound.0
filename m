Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CF3EDE6A;
	Tue, 12 May 2026 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612842; cv=none; b=UjBZM+az4imXvwHcw0F0aJONJ+IdU69HuksgCX+TiVZ6uCz50jfFtCAvJMc9NYyfeINkoYipG8skUUc9EWWubMBDT4at2lxoMnSTVu9M/HGRrkbq3YUDYUCCWeMYhacdhlep/nsSgZ17Sk5Zm8iSovy0TQDwu5D5Zg4ReBfcPgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612842; c=relaxed/simple;
	bh=tCXn/MgUKmrMh6DFaHVJ620Yy1DXnLahSEqzuV+k4RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GubACbZRx2QG3SADjK0N4exfcgAI7aMbMkddM7K1RxJ5i/dPw1plqvtedZLiptOpJ4bv07umXVhtXKDOYe6cZkT3lihFdfIeTxISvorZ7kv5QU774SNw93q4zSRKu5omjqkM14t8Mvz/GsOhwkWLGde7ZRiiHnAfq57rbiC3AFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=Y9JlIAMb; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="Y9JlIAMb"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=tCXn/MgUKmrM
	h6DFaHVJ620Yy1DXnLahSEqzuV+k4RQ=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=Y9JlIAMbInwWvDBd/l/S8M9bHKhLIR1sLOHdB/
	/eP1qJXf8NMvhLbiatplkfxnFmUPXbOhQJM/eYY95O5ln1jBdIIM1ZLtZMAnrit6D71Ly/
	6rRKQUbM7vydZcqf8MzEnIAd28MCHGl+LZXXqj3Zs7C4/51gg1l4E3i7pw88c+5yS4VGn+
	3ozzfq2E1MmiJTFoiJxaDV2zl/hCk8bJMMI6V/E7Vk6I5kOGY4LG2LqHWUmGSH1BdU2gaz
	VQbZful5NMgTNahJtNcBFiQrHh/f/x/txQMC4qS4vQ2KxpJTXSsDM3afN503iY5ti98+zo
	0NzUj+XSIzYjDQhT4piZGh0Q==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 8a024604 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 12 May 2026 19:07:16 +0000 (UTC)
Message-ID: <40e04485-3d2f-4359-9d7b-5b530d0e01da@al2klimov.de>
Date: Tue, 12 May 2026 21:07:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] ASoC: codecs: fs210x: fix possible buffer overflow
To: Mark Brown <broonie@kernel.org>
Cc: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
 <agMeMXwKVrjJZ8Tw@sirena.co.uk>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <agMeMXwKVrjJZ8Tw@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In fs210x_effect_scene_info(), a string was copied like this:

     strscpy(DST, SRC, strlen(SRC) + 1);

A buffer overflow would happen if strlen(SRC) >= sizeof(DST).
Actually, strscpy() must be used this way:

     strscpy(DST, SRC, sizeof(DST));
     strscpy(DST, SRC); // defaults to sizeof(DST)

Fixes: 756117701779 ("ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  v2: changed commit message pseudocode `strlen(SRC)` to `strlen(SRC) + 1`
  v2: changed commit message pseudocode `> sizeof(DST)` to `>= sizeof(DST)`

  Now pseudocode should apply against current code.
  The diff ITSELF already applied to Linus' master
  and broonie/sound.git HEAD.

  sound/soc/codecs/fs210x.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index e6195b71adad..eda716f817b5 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -968,7 +968,7 @@ static int fs210x_effect_scene_info(struct snd_kcontrol *kcontrol,
  	if (scene->name)
  		name = scene->name;

-	strscpy(uinfo->value.enumerated.name, name, strlen(name) + 1);
+	strscpy(uinfo->value.enumerated.name, name);

  	return 0;
  }
-- 
2.54.0

