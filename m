Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30851F09A8
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 22:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020416; cv=none; b=IEQJIfDUDQSjdDgz8F1eTZb1bj23Huhy50sxypcQ7BYHiqhbADPTBQ70q+UWy58rRSmtas2bc1j+Xq3TAw4Zn/FAR7NnA1CbNhhWMoLvSUK9vq6tw3/m/A0E8DJ6ZCjvjExYJleaLB7kQsAvis46djsBjKcTBXkY4k5gVuSqYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020416; c=relaxed/simple;
	bh=ReMBnTVBoEx4tVDC0dBEmFnbe+UTyXjIi0laM1CuvsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elr9cCLW0Xr5yMle2Tqpgjy/osXAiJg9V5FsizVPYvvU2U4kZDnMtEWhaMQb78R07StYZj9Fuxx4TtVMsO2U0c8Coy5BFhXifR3dxILxsi0qxSXy/TadP7jzjynePSCSXXfzuNCubJ7yfGYGfj56JwGJ07XiVRRnjs9OHjlblks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOvfMk1M; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOvfMk1M"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e7d983f91so62654961fa.2
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 15:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778020413; x=1778625213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4k3o1MtIhSEHki6YNMWi78SGlObbN4TdIsJculoTZlE=;
        b=jOvfMk1M+qdM1gCcIBRZVPBxA3eT7Tr488HirHF4viqSoQuFwBipiITKIf1v0GcwKR
         GsAejM4hlchdBn5GGxmYsoSTPPljzrlI4kCV7MjFWL7o0//Kbk33x3THK2CZlZEuzohT
         pPLPITxj5siG8JaEzwKP/yA+s998aqJsxvC1vxZwJT5Q15RFF0M8NCtmxzYhFUe3ZGZM
         awwrpqgIngax8KmFyWHbSydMmQUm+wh6b4B/4QoWNJGOtLbt1q2ttHGOzF/y2Nv8kyCr
         SwohVVMAir3M9e9ub6IQT4GTB21R4eCRHoFj16z5lAEF5KD4R2UrEAmMR3tGG2X2jcTJ
         Qz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778020413; x=1778625213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k3o1MtIhSEHki6YNMWi78SGlObbN4TdIsJculoTZlE=;
        b=i1/BSuqx0UxmtZ8T+oo2bIHGDJJa5ia9Y5kVV/hPAgdCXyuBjvllTBxiSltMEF7m1S
         hPuZUZP0ySh3grbs9onmeXQv62rql7dHKJXxVsxv6sAqMbf9DqFRoV90x9ZqqFofS86H
         tcg3MQoRyeCZ2gRwqUVjrgeankPeL4BSDyHoWyF4u3WnYKSv6UaD/33pxCuDg/zmk6a3
         m2RZ6iewDXfTmZpsILdTC+b9bsRikPPVh27Okx0kB6Kc/A2tVL4KD4fKxfKKHIxFRYvt
         FmEGV6b7hGJBY2GXOeK9D+scDtVfhnHpSTAB3w7zsNpKTUpQAkvN8IyJcDIuPwUmo9qf
         hZOQ==
X-Gm-Message-State: AOJu0YwMXS4wi4CULWNfWc/49R5IZsinp4X3yymF4T/N31KBxM+TCCRH
	fXGFZ9HBTNYAy4fw59bxTXwxHIWOwu6cNcTRttcxoDqbPfcIkXgj2fmBx/kFfXo+
X-Gm-Gg: AeBDievfOgioSbmQ+BXtqrwCEtDs8nVF4OjmDuMpWWvUyj4VMOCNBeY+9ovVpRmST+O
	OU2vPphYzL6KcIORoNlWQ3rDC4n7RPzMM1zngF9jJtppbXzwxmc8R3dnhgVDcMXPkUtZrh4jwoS
	NGTajKkp49KqHL7fzH99Kqz1XfyrBJlzCxCnK998xXw7OESHqIBOGozqhYzjZiwNMhyUWniNAVg
	et56YXLZzVczHhUEFbwvcPrmx5Dwma+NXLOi6+l3EFjuzkgVYAlMf9eqBPK/1CUXVlL2mltkmFn
	3T7nE3PhZdqnQLYroLLgAn2kHieCrDjBvpAwmIVToLNBQjQ7fx/AUTa2RZgNjN9hodmZpv0hLnh
	wG3P7PeygYTnWw2Bn7Zh92iNBW8+4kTDhdWEcdeIgLwJjAhsVEp0eNq8jwIG284X3UXWg6p11GV
	AXjlC7zyHcI/t7frLr+2LOIm4xkrOrIEF+HECvF3VB87IlkFOxb1McmQ8lqPQfxMz16cQ=
X-Received: by 2002:a2e:958c:0:b0:38c:6b40:c6bc with SMTP id 38308e7fff4ca-393c42147d7mr3258281fa.27.1778020412524;
        Tue, 05 May 2026 15:33:32 -0700 (PDT)
Received: from Shofiq.home (87-92-218-151.rev.dnainternet.fi. [87.92.218.151])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361343c1esm44423971fa.34.2026.05.05.15.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 15:33:31 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH] ASoC: atmel: Fix typo in comment
Date: Wed,  6 May 2026 01:33:30 +0300
Message-ID: <20260505223330.5678-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake in comment:
 - occured -> occurred
---
 sound/soc/atmel/atmel-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 7306e04da..e4b73ae3d 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -47,7 +47,7 @@ static const struct snd_pcm_hardware atmel_pcm_dma_hardware = {
  * atmel_pcm_dma_irq: SSC interrupt handler for DMAENGINE enabled SSC
  *
  * We use DMAENGINE to send/receive data to/from SSC so this ISR is only to
- * check if any overrun occured.
+ * check if any overrun occurred.
  */
 static void atmel_pcm_dma_irq(u32 ssc_sr,
 	struct snd_pcm_substream *substream)
-- 
2.51.1

