Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630893;
	b=Jjok5tptnKYxKT1Ow1UlndKS3X1dVtv+U6vCuHusGR5Mh1UFLQBzj2mNTNkKhjgvIucA
	 sLlgIKpMHmKbkOXYz8/x73AR8uPn3Onl007iiCb112wSafkHxB6Y55MPm6cs25RwEYcfX
	 NNLPIB+Fpg7NibVilthMSqGdDeECclZzaMznY7nDWVJ5hKUOGDbmn2FOFhJrWMBy+1XcV
	 l80h7cfos/WzJFzjR9VqerQ2ExKJdGgy0RN0GUWc++yphzEAqK7iuXdVEIY8qJ99GfYFG
	 yiH3hzmfol8nsXMpeyBHvcKhioxfbfOEUcs3Yhg7nM+D2rQHAETrITOsYJD6ETMIgiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3pFwihf4OYIQkLrMqzaVR206v3bx6SADN/xgUl121K4=;
	b=I/lqLbbHuC6BM2yWo+eMMlnCl8Wqm2c0+qg7BJlCZW0qvwW0QUukvfiqRQVxADpqQ1bP
	 2n2fmgvnqQls2EhFBtRaFbQBz0ad24FP/ULcPYSBuMT6Fak6v9BGDOE3bVcsO5EZJ4kjb
	 n3J3Dwj6wptGnzbGiKfgfes6FEO8uxs6NZ5Q/XhsuAm3xOS0QvURiFLjLtJhmG+S+hpFu
	 tkxzOaFP3YUcL8TKxkFObwL8MZnKHSnK3VFNpGpw+SV56oSMGCgZd5eJX7p8SgmkyzKix
	 ODz1OCsKk0SvfmDjGq6mrzSElCT3ZmslMXUpLjjamuWT13I44tJTnsJf4p+OXZkRq4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6xFp2Hn;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8295606AB93
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 14:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8295606AB93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6xFp2Hn
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a2551d7b5so5156507eec.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630892; x=1794235692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pFwihf4OYIQkLrMqzaVR206v3bx6SADN/xgUl121K4=;
        b=y6xFp2HndvqH+7KbT6FlWKqYYXmGnaw8yV5oCA3j5x5oIrnGxUXebmo2/EQHdJm1ZW
         yvt6tNcAQu8yY6jBmUFF+FuHAF3D78xQUplQZWq67w2PdmO6fES/3F3Iv6cX0Pp8RJgo
         1UdTMDnL/ur6BMYLGyA1U6Z/SxTg5GHxF8rS4yxrv63ntQkJaDWMa1539TUyPL0Tj8y+
         zGVJ7RLDxFGGRJM2yuk9Lrvck1BMllEVLLU6dzN/NYfNulpi7F3os0qjqvOK3z6mSdBX
         dSzp17Jc2goem91Hemojdw8p2gvWO1o/NNzXaAGiJ4/MpiO1CU+entVD5P5KsOGEUzjK
         roxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630892; x=1794235692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pFwihf4OYIQkLrMqzaVR206v3bx6SADN/xgUl121K4=;
        b=bJHD03EbFrKbz9TsM4tweUNVaInTFf7JYWiuoxDCdbvNOdZeihbxpW3d0OeoiDXp8E
         J17hRJV4RBYUU4T8e46ZH6luQjM3fkKSaSMnmFqzPb/0uNKG9fAFAK8RjcEdo05o7w+k
         1q6scfNuY7VpgpQ9QiyHeyGe9n3V9F1oXaZMdkO3AuDVJzTbE4TrqSt9Otkt7+/MjLvz
         iV8iNNc1nqys95kLhhdYGl+0bo6ORJC1likoJcFDbZiMdoMw8fEr9LbsNOMEpxJYRF4G
         XZNdVXsppUuE2w49dQHQirmtDOk0x7eTeccNTCLiB3x3A/c0u5eOQTfpkbgW5jyaYi09
         dauQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2M/yVCAKDiJbuEGrmUiMby9PlQZ/1veUvQVqJbdG9t/5JJa9CrCmvqK/OG52oecrU7fzZjwqoDIIOqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+sg22mzx67y6I5HFDbZI4oPRtkaHwNnvmTH+fleVAMapUGOEXy
	rqt/IXKSvEB+c9W2mXRhBBd2g1B21xmDYDsxx9S9CcQcmmTMVnhBNeZb
X-Gm-Gg: AYBFou2K/eNivYrtfFbkt9n2s35fcJ7sXSLk9TWcWVIJa09Vc1ITTrI1fR0rrbNgGyY
	3C1sthu4YipIEiGOA3PREOAsMuc3rc+qCc2F3uubX+ThR9AoGVogbnJuSaRhUIQwfATFcIYAzhr
	BM5ENKwRfJllR2dz8Pgu/soP5jH/RlFtWeiAzgVZCWMzr9VYJn1HiKVi2OBChlsk6z/1MPrhg7m
	vpDQyz/eyOmn3sv+aIurmHJwjOYxaTZHR+MCc2z3p1zmL3pzty46r+9nzOXCttH6FX9ONeGG/DE
	WPDs+L8A7pPa6zJIFXvPfOHZW4Kd8lFcXhq9CkN7B4giAKIRAss0BLKv4ZZs5J/mNDbdIMPsZjM
	qonNFDw9BTnIA6FOBqWlwwkGOfIDp/q7o7F34OD4LPrgKRa/rwh26uAh8tOnbEVo6kt3VBKz5dL
	7Xbw54YF41Mma7Y+pAkzlTnk62l6gprW6Vd0HIfo6+lHRoyY3ZrBGWhWKHU530W4hLbVElKEJh6
	14cN+A1cQOfuH/SDOBsxdkTt9fh5LOORqvmvrf09Dt0iHttqGNHKLp51lG4J2YofPb82yzjmhpM
	rUdkpeN1ZUgA14jX2IqClFdscMvAG8s98YxQm9FVquCUrmsSLaRl
X-Received: by 2002:a05:7301:f8d:b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36a42389011mr14274813eec.6.1793630891952;
        Mon, 02 Nov 2026 06:48:11 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm44068418eec.15.2026.11.02.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:48:11 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	sreekuttan2156239@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 14:47:36 +0000
Message-ID: <20261102144736.3679-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87wlqv8ftw.wl-tiwai@suse.de>
References: <87wlqv8ftw.wl-tiwai@suse.de>
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

You're right. I checked the callback implementation, and 
"snd_pcm_plugin_client_channels()" always returns the input 
frame count. All plugins created through "snd_pcm_plugin_build()" 
use this callback.

So the condition "err != frames1" is not reached in the normal path. 
My patch is unnecessary. Sorry for the noise.
