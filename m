Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929936;
	b=neL0A8kvXiyTlnuc84JcPFO0AX+pbblNpwFkuUBtV8bJkH/AEqL0q+drJzvwDcu+paDg
	 D63kcNybEcQgfHFKo2V/3zdzX2XSs3S8nZHuMSqAWjcWTMzdlypls3JlCmvO/Blew/8QE
	 7iDkKZsB17B+nZhAU0zDh9/jt/LzD2trEWnMtHxVLr53DsRoSjhz73Qfi8UPGk8v3ooxk
	 ORYnf4QlCtSoEECaYY763Dj+cgBePr0uAnkN42F/KaM7OFyVg79feBQattKnwEf8jTzwd
	 xDpomxK2wIV9Wcv+iHIEZQm1D/7nQhH9YdgQjTJVXaF8Z3guC+E6GnWrq1kSyMaiTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2OtjkmM0kgAG5rBlapfGUja81WVEPt17G99gLjcYGE8=;
	b=o1VzSHtpgXgulnbIyXGSOzeKk9mW6fDSVTXzguCpvRy/gN0s91P8PVV+AiQ9zMJZTKlH
	 jOOAAigmMoLEbP7Wj4v4yXRRfMJQFlHd1bXxRjsqteG/FvHrb8hEeTTaCoxd1AJsW3dKx
	 LNUREmTD6xbvMGbVh6f6lzspzlxYO2U7c5q9X5+i65nzB6ynbR1Pl1jl/e1HDYKvRXwT+
	 F2smSQ1M66dQsQRXuvBKKj9DcnxS5KW8si6f/rw2XvoRpAHfWiUDXTop9lzmPd6VP4SKs
	 k8H7pu2j16GSjRweNlnnIXADXEkpejfr44FfGN8ceHEia0z9w2PCFGlIP0gw29b3j1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoFrHDhb;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05F606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 15:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB05F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoFrHDhb
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-372bdb942dbso4483342eec.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929935; x=1795534735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2OtjkmM0kgAG5rBlapfGUja81WVEPt17G99gLjcYGE8=;
        b=MoFrHDhbS3d3mwGDQk9t3CBTmOF2XBVomXkTCqKrwScvbeexN/knJ0CO+XQkvytkIq
         O9qb27K+Z/uhl3tlJLpWtY0Z0NXAtjYamPUWCv+x+4Dw0tF2KxGG1VZmvGeQ4JeT1dGJ
         sURBf4FcKDwpWuM7curHUBjeThgDlhITNYNnIcbuD6FxctOTd8wt/MVitoKmnFYdvt6v
         jFB1esWL4LbeujsAg1Xl50fNmiESP9Hl15v1m35a7himVnq2cFlnafixB8IqFmDAE0yc
         nsUD4m+HT0ZE2ZyWdCDJWwxeS+NtYH6ENKvcUThkdMnylyuP/9unuTJNZs8hhizbiywI
         xPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929935; x=1795534735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2OtjkmM0kgAG5rBlapfGUja81WVEPt17G99gLjcYGE8=;
        b=bBcHV01kkORAyQlKRth0ZuyKTX5TulgmM0hpMj/MR7rU8TfGM78dcrC4QOpl6/Z9xZ
         0bwMtkiMh9LVerZLtF/01VRAnT3nfJnIqcA7hWmBMemfDONbpDB4O9wt2LZDo20AsRo3
         YZY5pw/cBEhTSQvSEvEN6i+/A7yPnvKkq0eMKnIGvsea4lZeT13/FJd98ZUeqGq9gWKT
         8aoC1S/fOVOn7aVmYTZRMLi9SwdHZvjO6g0YlRR4Qx+zIRfP8HbcASkgnrF/xPYvys0/
         eTtjVUeD2KcorqLG1CXFxjgGG81mGPsoqkSBdBm3wa0rF4zvZfbHZGcBqjxu1uZhSztZ
         mNmA==
X-Forwarded-Encrypted: i=1; AL+hErGGKZEEsSpvN/zXZI48FVPMFWyyXf1EVVmU7l8pUJXDqz7Kz/QG2xJs9BXuKa8lP6P6QYoPaO8QOo/kvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9M9Zrk1dMmvb1936qSNcoY9JANiHslgAO1t9CFN+bKdl0IFXoD
	HWj217hj4WqxwuALnYkZ6nFvN0zqC+UudDiitzsR7kdFzT5pogrNu9XK
X-Gm-Gg: AYBFou2Rbh0PRJBXU5XwsLw1jBRxI/ILRoLMMYgh0hLs7AF4aZERJRgFL0HSyXMnzLj
	KWHU5fdQd2qFtkYlnkvBZEvenl1hzGknBS6xpZOS03lMUTPVeOEZx64Jsb8liHk71J+NIFm9+Vp
	QCsMVckEViDGsIFFffywvdIzUxgKVt32NzAAOKfeQXgWaKXUu6AQ5m+EUXyfL12+RuJ6/Jb6aOF
	duk98+xSRtcIHcfeOac+zasJeR4aqBFQEQffym9I/ir9ppfvYJiiPXWEDpTan/A7svEfBNI+9hr
	V1Fx1IuT8XUU5HE2rGJSjqEVi7kjyrNP682PUAxk1eWW1X3qyScJUmi//sLLGI6ozlwW6R59Vkj
	gwYMu4D7q6//241esyIpxqp1cHOtdX/oXrFqz0BDXNRA4i5hjw8TarJ0prFwOjCmekVslkdLgQj
	KM5jeioksBs1FJUrKNxhAklPpNuM84vEyPbdLneZy3mKDEfJKzjQPZn1EkoLIqQom5dEZYcvWRg
	uLzjpcIBWji85BLvxgCbEc5laBqe6qSYTslqNgqOlmCKQNuTHDciesShd7ra3wbfEdY0gj4MOYq
	yz6NJlu3bXlxe0W5hR+0eyM0Qe3xgeZ6qHRF0wCfS7wDcL6CEXU=
X-Received: by 2002:a05:7300:4faf:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-37967ad9432mr14017145eec.19.1794929934846;
        Tue, 17 Nov 2026 07:38:54 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm85897893eec.20.2026.11.17.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:38:54 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: core: Validate card indices in lookup helpers
Date: Tue, 17 Nov 2026 15:38:32 +0000
Message-ID: <20261117153832.2766-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se0zxzyt.wl-tiwai@suse.de>
References: <87se0zxzyt.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for the suggestion. I've updated the patch to use WARN_ON() 
and included the safe return values.

I'll send the updated v2 patch shortly.

Best regards,
Sreeraj
