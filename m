Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4D22332B
	for <linux-sound@vger.kernel.org>; Thu,  8 May 2025 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709078; cv=none; b=MbwVSPsOzjac37J5A+dHkSZDnL7MWWfcFbWd9Qh3HQcg2N+ezO7okDquwaodi7jNWasJqWBNeImP4a4fm1lhAo4LtgLLEGQYelHrgjH4ifKu9xAviYXvK1Vu3IXW3mlH2kBr+QLX8J2ZmE2WcvXle9yy6raQ1/iIbKHsmto6UnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709078; c=relaxed/simple;
	bh=h3od/OZUMN3oh5T0hUXF8qsNbZ6GG1EY18oqLAL5I5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dnp22OeQzBM75PYMQbLobnJM2rhDAm7wEeozI8vlprUO6G2uKTFGfwM9I88pr/9BKXBfSKoBVBJrseDL9WLXLVL1OdaxXyhfUSzE32SJTzIAS/LbErQOpsKrGm18BzQWVPOGE+ZW+H9WSCAhFBiAcv5k3H2msTL05eDEWuJt6VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8fhPjbf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8fhPjbf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0ad54f0aeso121843f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 08 May 2025 05:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746709073; x=1747313873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41fQ9P7nrmZ9gEDUpXifgmNoxRJM6C9jPn3nPNbCsy0=;
        b=f8fhPjbfnn2ANzdlY4xQ449xb/u7gjfEm6ervwAXJHH/ohSsauTBQxrnBK9OdhxbC/
         dw7M23DqSS4hb3ZJhmpeqFsg5oSWPlM9tQh0MDfPu8W5Jzm3DTnc8puPFoq6CRcNIZrj
         Oc9LSQpqkzUxsQXXht4UJ5nBxJuKhvoVRwT30OrMkmUtFEpN7xBySXuwdxvzrLoykh8l
         KIhzjSde/CEtw6R9YEq9l4YyWoSmC69BAHJj853hkTPToDXUNLIC1k/Ate9sVBntcgbz
         g6/asn/s8eBcW00PNlwnVaCWcJ5+ok8NHGLrSZCYJxd5W+EJRj/sqFbXJLYOeJb66CJ+
         hhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709073; x=1747313873;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41fQ9P7nrmZ9gEDUpXifgmNoxRJM6C9jPn3nPNbCsy0=;
        b=hWV59lXFotDpI4l9QQpzgJg6sm+SziQja9USnnpggGYv4CTiEZ8W62hTTtjcLDTLtV
         nh6lHhvExqXG8jBh9WK0JhDk5JXEBOqKf7cZrasnspeXl5qjDoG0wBQji3ZaH0IPuLGs
         DustbSOP/1P4B/N55unVaWILqtsm1sKd111WGJ/RoMuH1Rh3XsbTTWLjSNahbfhcRwSc
         a51Ny3Bqe9RLHB5yZNvy+mw1ymGDMgt9dgktdtXLB6X1+ghzsixi7Ly/uxaNaPjw2uvY
         wlpPKgEdbq4b+ZkWxpI5LdZUI9yJmei+AaWceXkJSTvCqgJCqJGnA8bc4CP8u4Q4FGZS
         99iw==
X-Forwarded-Encrypted: i=1; AJvYcCUzBaWl+pWxc6ErdJGXw+Iix+VaBicob4tVVejR7hP2DeNPc/FcVLL1FaCv3ycut5apXXE1eHIfL5LN6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCu7oxo3uqTPWgHQu7UPi/e/M80EXgFstxXbw3Z8w2QBQuxti
	6g4CJzhLumtkG6fz4BvbLQqazhwX6f5oDkbcP9vnT+W0hNv52XIgS009BACRz00=
X-Gm-Gg: ASbGncv9E4MTITjm2fC7T2QFDG0OUh+U8lfvME4Ugm/LEEPSWzze5n7moM8dSKyymPa
	S1DYr9IiSEjfeM6zodOyGywXAc56NIplBsL3J6BssGnwo2ugemCFn0g+0134LtJBu/iqkTH5U0s
	mhJU2CsrYHeIuS0PoqQhv4dBVW/Quti+ik/YF0kZ9G4SlwEtIX24oCXQyx6hszzZ4mUvkaE4C06
	N9O772tEDpUrX+UjBwUlZX/2bjwQ4LtlhyQCvNNIydLbWduLvH0lw5Nh/M1gVh2cSANFGRq18hG
	5Xony9mYueaEsKAO3tTu/ZVO44TMoysV9YyP8a44brMFVFEB8ge1rmvecOc=
X-Google-Smtp-Source: AGHT+IHkKn5DpCm2MDSIaZEFKIGhgLbqZ2SLsDQ/T7AcbdUeYu5WwW/A7NgfILFa57g/wXMpeGSoqg==
X-Received: by 2002:a05:600c:3d0c:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-441d44ed538mr25318955e9.8.1746709073277;
        Thu, 08 May 2025 05:57:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd331221sm36183705e9.11.2025.05.08.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:57:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peda@axentia.se, broonie@kernel.org, andersson@kernel.org, 
 krzk+dt@kernel.org, srinivas.kandagatla@linaro.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 johan+linaro@kernel.org
In-Reply-To: <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v6 1/6] dt-bindings: mux: add optional
 regulator binding to gpio mux
Message-Id: <174670907131.90037.7280261510052841645.b4-ty@linaro.org>
Date: Thu, 08 May 2025 14:57:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 27 Mar 2025 10:06:28 +0000, srinivas.kandagatla@linaro.org wrote:
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable. One such platform is Lenovo
> T14s.
> 
> This patch adds required bindings in gpio-mux to add such optional regulator.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: mux: add optional regulator binding to gpio mux
      https://git.kernel.org/krzk/linux/c/e9c695067b68da6b39e0d70cd4a061d0f70050d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

