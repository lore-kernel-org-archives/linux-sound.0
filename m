Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9A35294E
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783770009; cv=none; b=Q67gHhY2S4Nhn4Ow93q82azuQl+c0Yd50BqNdk2C3aLShmlA9i36ERVqC0UigEIqwO9rO2V/eUOwbqeYvdvvfIQO0MU1wcQzQBoCTZNcwUAGofHfi65VDWhzHirlui9LwZW8HCCsG+dsPsPIx14hsXHD06UiYEGPLEro1YW4ChQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783770009; c=relaxed/simple;
	bh=3+bmWam2Mg+1DChzKEqedzrXK0RkseN6c6pm2NsFuGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsxw5wYx4Qk6a51R34goEGqhxC47Lw2rasnQH7XS3lBUtlKaRf1UUPVJNBzIajHHdzZyFKFLDeyqzBU4d3Kf9tTS9wb0JNptIM5bdfk4D808EFacMjDiDw1PK0gbDYlW0xvnhSmm047DO0vveIRlNNEzmGnBHPlJOexSI0IW0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXNd4KDH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXNd4KDH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6563525e9.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770007; x=1784374807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+bmWam2Mg+1DChzKEqedzrXK0RkseN6c6pm2NsFuGM=;
        b=RXNd4KDHyCCwlLIbPBKVoD3jDiP4+EDcnZb5Zb3o8d0D5+AVh0p8GMskSLeBucoXzx
         yGiQrso+de7I9d069g2br2zsM1r7jqYPLcXbTsFFjgKUrl/pY/5lBWqHntIk/G6CW1MX
         /7R0jqj4T9BRkPo6kcA1r5Atuc2FxXceWKVWR4V5DfgCI3rtYIV4E15uTjwExlgDtEt0
         SmGMw4G2nCQrXKLUcsuRU/MZ6aD2KRi+ptN3Und/yjqmJbFFxg3xKdhVU5Q6ukQkRI2x
         Hmko5nJjk7cziXP5MsUF1dQB2uCCLQmWmxa0/fOpZxHJpU/l2AzlOzA0nUgCpYziv4uV
         VBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770007; x=1784374807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+bmWam2Mg+1DChzKEqedzrXK0RkseN6c6pm2NsFuGM=;
        b=b/m6HgBqHq0SQtSHCmQx7aG86v7tFTmtN7Z0DBgRGTl8sD0lpSJ9YbcMsm+6ZE87AZ
         EsxV372wuoS2r6m6TyxmGp3+kNaZC5o65unx7+R3IbNctZm/vh0305e3kJEC3tHjhZoE
         3WjcjnfR+tsPwyIVAkRc8nppKtdFY3vpHOk4Fw17vINJlNafpI/GkLmd8njNrmI5Ue2t
         wUBJI6xO1DaslEgGLWHKXO4X19+mzKsSJfCAFIoKoNAOZfdhKH9aVteumQ2hxJ8coEly
         ZUD2pSDyelissgQiS7KmyhMeOhbWj4BEu73gEPifouVn2SHGKGVItmcTbTT90dHu65Vy
         uXqg==
X-Forwarded-Encrypted: i=1; AHgh+RpxkEMhBz8fKNY91nt4IXLPMhmspEZRhEZsJhahUbvdmSd5iCiBOo6PPTSc70HMtAPP0YLTKWGITfakRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPF/uf22yVFL7NgoJmHUjMRfWheqR3YlWKG/w44W1TelkLd0rc
	aQfjSmDphSIkvosad/pkuoN3rRAr+KlxuQK0OswojPFI6FTEyFILZnKV
X-Gm-Gg: AfdE7ckZdUN5ibst9U5JWJ4iPwddXqCSyk2TNb3LsYehj3+P7A/Ffta6EjbIT+grIAo
	Hx9IkMOC7apD8Og8jmzwyBNoPI/UILd5iHczloMHOa5qBNc6oeMF/wmdSvfnENr50694VFWASKM
	sJNzLlxSogajaNUMB/6vbME0VdQII1LoxmlBJcJTOzGtBF4clnwUOpwKy6CR87URd/idF9YOTf3
	ZnZZUp9okpHk94NUXwGqT+0qoV/hDpnMnVzbve4FkSDJ2gI1J69/j3o/YzkntImXnTju5tXgoTD
	fnvpgzGcNwjroiaBdX5OEqrKDXoUJ/0tl2D5D1mzoBNGvLbH4eEZkNuzVu+DMyK5LMFe9yaGWE8
	kUsmxf3yiRxj0ri0VQqJ5vcOe0eV8fD70WCKWPnnnQI+lZbmdNLRWoNXt1BqyXGjK62Bd/W38r/
	ex0jAJap1GW8h0ZAB4yXBjCzyxtKwp
X-Received: by 2002:a05:600c:37cf:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-493f882e97fmr20363055e9.32.1783770006780;
        Sat, 11 Jul 2026 04:40:06 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:e106:f973:a70:bd1e:4000])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493f2e0eff1sm84510965e9.0.2026.07.11.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:40:04 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sat, 11 Jul 2026 13:39:53 +0200
Message-ID: <20260711113956.72582-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a79fe709-6949-4f73-8f97-6d02e1ee9d78@sirena.org.uk>
References: <a79fe709-6949-4f73-8f97-6d02e1ee9d78@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Please submit patches using subject lines reflecting the style for the
> subsystem [...] There's no need to resubmit to fix this alone.

Noted, will match it from v2 onward.
