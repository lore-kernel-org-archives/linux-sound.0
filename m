Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0223A2D94BD
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314437; cv=none; b=RwPlTYa1EzRwarMTayMWNSos7DemmOxs+HgSXKOlplbrgrrFPcd5YJPj7YqcUz4OHsRcvIcItnnuG12MqwwoW6vvfaxAz+cvX5gxLda672o6seIStiiH/MiiZwPNbw4yk6x2fuP6qr4BojMn/h4wzBatS6SsxS6JbflW4XBwaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314437; c=relaxed/simple;
	bh=f+aH6/K40DnBsB8l9bVVElGY3Gyi4O8l/slzikK0lyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlvpIXDtIdDrHkiDaAMg0vZwAmTJbvDzz9pAePE+Gd+HG2bpAhOmD6X4PhogqS6fZqs8B42L/jOYRZZwQnXuQx7y9yJg+iz5Xd7WJI9/yseHjuPz8WAItP4yfPoq749XsrEdGUVY/Wogs8VZm805S4pMKNkyv3pIiscOFziXGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9g1XSkv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9g1XSkv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so940742f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 23:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764314432; x=1764919232; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWoYgNWTWwhW5di9GDfBHQKaAPyH73xqzKRb3keNbIU=;
        b=Z9g1XSkvSFXpMPv4s9IGhfKLYeMJSiAJFZV7Jg6YEMyKyMzPRoJqtgldL/IsC8A6nP
         R/gEASpxg1G3qXUonjVHNUqnHPnVHqnk1iYvqrfvqDW+5SaP+b09aN9moKn4B0u/zz4M
         tsPhF7gWFfX74D3ilu6AtobDy4vaijcpJEeH5kEolYsb0xI/RUI+ePDMSb9bHA1uq8dZ
         fvmj0g5Au7sjD97Uq6U13lp0MsvUKQLdeOLcCUIhxZVIXV+sd1InRJOD/oFs3sXgXPaS
         NuwUcaVHzcOqCAAlHm5LfjlehAV2tOTPjo0vTytWbt+YaSqDfq8gwpj2WDwPQv2itNl2
         uQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314432; x=1764919232;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWoYgNWTWwhW5di9GDfBHQKaAPyH73xqzKRb3keNbIU=;
        b=vvXjQRNi6RjH/pW8/2I/j2p8Oz91Jds8ogTbKmDNBJanMuw6ItLGG8cgftzdd2hBRw
         ZqxDP5rttIEq2nb6tVU+vikgBQAmvGc0tVba5vHtpaRGO8ZgkqkbOiyOy0XyeZFkw3iA
         I0aS1mpUS6PdJjYLOtc4HxYOIiAKKf8HF2QLdbd7MrX/pyl87TQFNMWWevri52JRYPqK
         au8edNxpqJKmOlgzJuM0LJq9Wfk+lvPqnZDaq0rCtFNjV4fUUlsxcgZ/WCXJbxaTY/Jq
         xoGmH7GSyLyQiFuGGQziL35AGRHdIvaJvRsxMSoPnEDfJMFQeSLYqRHO5+D68TZy3DG6
         dsMw==
X-Forwarded-Encrypted: i=1; AJvYcCX/5QSXqX/4bRBAqZJL6CTOoS+KSmBGCeDvHT3qTkkxBOdXD8VFWcYTLb/7iRmGt5FTs98y5wC600t66g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMxkLao+wZJQAD0FDy19X+nZRPNDreNjTvyECOxC6VZ7D1U2X
	InUUncuTR6jZJ28JWrN6EqJIo7p7nAjxahAVsZcTMWMOXqJ2KQ0tM2mcPSqHLKB6DAA=
X-Gm-Gg: ASbGncuN7rtKNmXepbv6FlvHPrrlBPnxGPv8pwA66pxYqd2yUV3bfrjDoTKs8kd/75J
	SFfVN9v/JhNHWns8KwcVnwgrjVqhw24UKnky3ZeR3+/7fPYBQrbjYTC8WmzRkUZ2WffG9ScgSCe
	B7fa2jYhgjYmzSrJVYQMry9RYO390k+9tMgnh7P7stmM6ILenj/6ssoAY7q+bdOVEMCwx6DnpYS
	91lbJglNnhxW20AQlJfa6+BJ5f/X8TMn9Kg8rqaIC7a+SWee4PwjUaDGbdHHDEBytPebzxF+nWb
	Y01ftZb3QLmngSgB00B4WlGNLSkVrGbnDjeF7p1sH3pb8E3iPPyzlHE7EkTeY7oi5BuKKjls95f
	k9g7fhSRQ6ZZgpf1Nmhk5V9f2A9nmqfi4JryL8aES+Bps3vYEUgh7Hw3pcmmntn1Vg/G4VbUr46
	wNKEW0viggeZ3WiTu+
X-Google-Smtp-Source: AGHT+IEwl1VX5SMVB/NlLIe8WMXW7eNL4IPTOuYm7xccuBWy0w64ollMoWFVscshbBfOrKGju1AW5A==
X-Received: by 2002:a05:6000:3113:b0:42b:3e0a:64af with SMTP id ffacd0b85a97d-42cc1ac9a88mr26602666f8f.11.1764314432265;
        Thu, 27 Nov 2025 23:20:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a396sm7760487f8f.22.2025.11.27.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:20:31 -0800 (PST)
Date: Fri, 28 Nov 2025 10:20:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: nau8325: Delete a stray tab
Message-ID: <aSlNO0sqQr2A4vzG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This line is indented too far.  Delete a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/nau8325.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 5b3115b0a7e5..3bfdb448f8bd 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -422,7 +422,7 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 				*n1_sel = i;
 				*mult_sel = j;
 				ratio_sel = ratio;
-					goto proc_done;
+				goto proc_done;
 			}
 		}
 	}
-- 
2.51.0

