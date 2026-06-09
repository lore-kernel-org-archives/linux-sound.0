Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA433F58E7
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998586; cv=pass; b=qVqulqo1MulV4Z7VTcRfeBOVxGlx78fO5Db2jFQ0Rjt0R6gwxz8yq2Er6nyQdLZWNzAHs3S1XYu8jobznQm8ncgxnGsxGK3xim/BA1hW+7Cb2B3JTau0nEWVtB+j/gnEMcTBZ6jPFV5Sp7tSz9Rmx1k6zLxDph9pp16GPyMZ594=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998586; c=relaxed/simple;
	bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ca337mC6wedoeBpLKbY3rMsqR2QrVBt6gaJPIibW/ax1L5gsgesNZO4/ZGzmAzuEtsJjlvhl/UcXkPdCXrU3aUS5MGx0yK4FxMhjWMvulVREpjXeimNx3XaWj2Jun+v16nlgNmCueMVe2brmbWjt3cEKYhqT07L+S7leOPsMIn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBbM86Ky; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBbM86Ky"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0b9328c4aso37233805ad.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780998585; cv=none;
        d=google.com; s=arc-20240605;
        b=ZOhua84oVeTaS6MSwd0KmTsNv+E+alW9RP2/W5kqqjkeNEU2V6uUqjeaGkobAvqIQP
         oScHPBc3t01jtFWelhn7CfRsf6RSLZfNDkKTvaoxhPeq6hjtKxhcOaZNrp6WSb2Mz2BG
         1SIx1Lmkc4YQqVePBYMRXSpydE5c283F2E/LVsiX7qTyBxy9sKQZWLFxcimGGPUDpmxs
         qC2XQ33xD8Xg5dK9O1EkApTMUOuaCcZw03N/jc2N5Nd4rore7sDhOyWmICN9nyGuUndW
         tErndDK5K8cMNtQnU/ttdqbpRL3fr3r27PauFQ7ajceu6tmLi63/TWp4naqteDDNqylB
         2tIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        fh=3HFGN0rjjGpVlr8/foFSDP0emF/GNU2ogrEnxC4zGxs=;
        b=J6nlHEcFINiR+pI5RZQyn/TszpgljD+/GOlmqCZwHy9V8Dd3bia2Z0+xmsUe7cbQsD
         wNScvsiXL9Hip9KmPkhd0ByahlVUcI7qVeFq+8yueB53fBLsBpwYsoMjz34mzf4Di/ek
         pLYKr1048h5o0W7Ay52fB0RbH5OZymwPafLf/GoOb+W1zepOJDhaSQ/I7E9Hcya8pKo9
         FqfbLd2xHAKmPJrpY8d0uYUKC8hpFEwntvojHrYgeCM4rjwTVcTTqWK+TtnRFEX89ah/
         Bfw5sT9IBeUryZJEl14/oxgPhAqYE8HgDwg9NINLLSP0SBTH1jCGlqqZKtfXW/QQ/q61
         ENYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998585; x=1781603385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        b=KBbM86KyF2nfp2WA+02JDxIwb2euc7XguaPtK77tXmF9Yq6PJNheOBy2xScKCQ5Vx2
         X717y9ajvuSaCM1XXHpbajuPyGRwckuWfseGBmzsnunmD/b9WdFLVzUBCRa7y9Kx76f3
         ehCjBI5X3OPQ0vyKWxliXWwqltJyFfe1JGwhnw3EcZXvGSjTBrf/BrS/ORpkrEexRJ3Z
         Ity9ZSfWAoiOwD7S2LnFisB+SF46EgFv+XGMqdlF2Tfg2YD05dVmYdFFUudH8V+SrOP8
         ABwfr4KvR8ffng2RGQGb4ojAorVJGCAbtOtT47lzEX3IA7M0kx0tn7GSWS9OkiSQPLBR
         ePiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998585; x=1781603385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        b=QvUwFrmNh9WRZuMiOV0mO66pxmikfRSwUM2Nvp50mzFR8O96OBXuZRsisx8ikY8OWI
         vEMfyuR2lVM1/Nlia9M6dV5LuobRU81Xa1Tw5rcy2qBdjunsD6ffOqkaALkKRU1K05sH
         B/Cq7xE9dKZRF8swqSFeupYopBabI3LE0AUiHmyielItq6UlG1gJ59J5V77JcaZBx8Iu
         NhWGvzL8bBQ6a3e6bIzHegcCuPRdqFhq47q/Disf3B0/7L2I3Dq/Pxa50b8O2ffZRrs/
         S8q7Flw3fx+sN3wr3TVFXmegjnO+2ouaZKT7AmtlO/JjMTOClX59vwYiCG/okn/H4oLi
         oefQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LKiajhgHnwBGJMyE/YyyAjLEVE7I8B//FwS3dW9aAVysNIcru/yhO8qVuDihpxZgSnTdHlNFMNhAI+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/CwdKbGEJFhBR3Rb9L8HUexErVFW7gO+mNmnbCTmifBm4oZt
	/kz3suIPJh/lYy6FnvQif6ok0hOcawD4DDZfmSMqB/eERxMxK2K+Lv1U++xbcSzUuKJSB01kjv8
	zKZC8ZW8oQO0V16sZ5iRBHfJ5Rfuhrfh5NOQi
X-Gm-Gg: Acq92OGLitJRyxxilLmauKF0e+SqrLalcX0xOQY+vIEKyLVxYdvo8CXgAUrcZTipcU4
	nNjvo+jGn2uP5866jpNn4JCUyteJIxSNlJGOiDG1lAAhALPVtcjYXcv4FIwCMit9GCHejUJmwlH
	1RxH8YtcGmeSQE2Vea1Q5tt9CaArjecQ8zXey2oIKO/AV8aWq8m2JCWJDBdmMJnAEJIjkAd5J6B
	F+nTxUsXguckaa7RkbWXWbX2ik4ShPg23PihJusjwDZLwX8q/bXeVtdmZavw7dXd4i8ZfIIgwgT
	IvNGVEEn8dd4dadHmWEXCMjOvyf/5x+eNsxHezdcftvZWJZMPziYG+3FbCk=
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id
 d9443c01a7336-2c2a19b70c4mr29256975ad.0.1780998584740; Tue, 09 Jun 2026
 02:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 16:49:33 +0700
X-Gm-Features: AVVi8CdljbTt5iumVzeCFBObBOG-VUOn8HWf8RQUwP6hql8FD7Nvhkr27Hm_R2E
Message-ID: <CAABR9nGTi_Sc4Rn_Prg-cv0OeQkR_qjvaFPZAH8hf3JSCF-yZg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

> For all patches (except DT)
>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>

Thank you very much for your review and Acked-by.
I will send a v6 shortly to update the commit message for the DT binding
patch based on Krzysztof's feedback. I also have a few small updates for
patches 8 and 11 to address comments from the Sashiko review.
Thank you again for your help and guidance.

Best regards,
Phuc
