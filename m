Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044522;
	b=K8uhBuYhBRtiUr3tvLaANcp4phykxJgi8aSwx7KCoPXNLgUAgSCwygh5o+kMF+Z4StLs
	 lAHQ0GqI5nea5De2p2q7KqqBVf+J/rJSEaqqehSF+/OwRhRk9ZBM2KRMUcyOjuiY3sCic
	 h2FpwDm+xukA74fxt3ffBwyu0tW7Pmmd2sqQ4DkXbcX0V+HpdB7e0uB32tWX4Nu2VZRjT
	 hFohO1xGOefxp4+oWDoHGIWbCeSzcS1ut1GQrOUq++Rv++BHtsmzAlpjg8eifcTLfEYZJ
	 cIdspWwy3vqhxoyU2XzKnUp0Fyv/KdOO7pcVg6RabkLzKBrfTsB7FFNBMueL2g817tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=fl5TVx+lWRWMYZG5t21vPHvwepNCvjHRM1OeHbe2ymhs4gJ993OZ9j/ZvC6d34DahuMI
	 zP/3/ct2wEkFLu3I7zm0EM3qUNm5WPpjRT0+chYT4V/t45RY+yviizAXzhHiPytSAjNuk
	 uqYrO2/MnNQv9us6/B0YmtCE8UxnW6x4W7HupPyMawE7Kyhfbrh7s/nun7KC3OF2LCTxP
	 v2bb3yhY3x4Fk3nWG3dfzi15ime4YOYMBnAEDLrNNz6YrqX9iR+D6kdOUgqrfgPSzjaJP
	 z99DsQjDuIvCyN2dpB7HlS+qPNekjrn2HPIAdJif5pQdvPbxm23NO10o6JXfHf48ONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uL61zkhZ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D55606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uL61zkhZ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2341173eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044521; x=1794649321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=uL61zkhZRsFHHsiDm5Ks9IqWBn6C2E2i8m/z5Ymh3Z0F0tvWtUGd2sgK1touStbTx7
         7ZYnNBhr2Ok6MPLtTpjLepfQvAY2/vt5oAyNzt7CGBVMIVu/3Qn9miBcrIo7TpiRLALe
         uu0Y0BWAA8UChcbO0SArCZVsq7+U6B7Au2AW9D4XNd6xgMW8UJwL+qNnYVN3uCK41OVA
         Q5BclcM2vPmDvNt20mwH+/Sm2VRdR2j3ug6WcgHnyg68pJauKTDtdil18QjUblS/+iLT
         Z6f6QO0SusKLn8wSBj/Gf64S2bk9VYAN501x7g1YYR9LAgcpv3UqjxFXiG9Yi17OlIDd
         rq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044521; x=1794649321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=2pEn7VpAVEzpwpv0aNd0f7/xsNMNNjm9pd9uELx5zVes4lI5YlRTHKJOrzij/XhPy8
         IRMvICH2Hj51cjD2oN4GfU1ZuRMqWC0vTzcQbFjBvGzw/kYQXUPqpvJaqdjnxnZi8R3I
         uCls7nB6W/WkqjrKlP2gbTzJiAWsAgwR3vRZos3ma1jBhDy76dqpr7gyUovNVL4gzeRm
         JTKQG4w54Wo0HbudyxkSB1APuJv/HzFbIqXHcXNHowzKr7ZMUvTVgA4pqaRo9z3/9va9
         j98/dFDOa0ypuqsh/dcM+H71nhRY4wBWdQxjLA7GLxVkHVuMaM74SdJF+giQJj9qOkob
         HVow==
X-Forwarded-Encrypted: i=1; AL+hErGNlXnXcK96UKuUu6+jeavUoqWlPHEwYGIZfsxrTfJgGXAc3rahCPQjI3B6o3+xoxD4sbHEsqfz+/du8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pb/meGb7VZBm/peXOvWXzd9zQXlMVC0fH50FqeZR8xA21UdnV
	Mkf4sU1n2d54yGweDPSow7aCXrFWxo1bHMhlM43fO4VBKoRqpXQMRard
X-Gm-Gg: AYBFou39w0l8n6Lfu+VFce18l7kgkG3yH6GKOKmNWhfvAda5wFev4yIv+wSCpg2knm1
	v1AxLC8T94seuiOFvoSdvDpAaHqwYqlhNcUQAFfnltBBaW4w3vr1DBnxb+JHGh9Rm06WWyMaOyd
	+kcu2+WCfrZ8xWmCN4+DsKYFodZZmmLJ6tkMO9BfvaiD752cWawtJHpLvktyRdrsDgg4FD237pv
	m5wfLr7NPuHf2gZ9be76d/UFEILZTNlOKZINSvIetHDFywI2r259YPBNSssqRtvbjx2jnChc4PA
	e37fS8nHy4E2CWnppP7/mQ0xu1C94BJRMjLJkbd9JLCXIJhRpGO9yVCwj4ggydI4bXrHLbh8Q32
	h4ZD5HvQCNVSzSAenGnLnrrOCj1pnx6CoeWeO13lLRlHtqeljcKuKdRB5U+sfUXvc2yh4PjaPEx
	XXl7kqmn34+HeZsg9J1fLxdWO8BD3tJdrfcU8aTgQiwyrpeRNz0v1CuFTjLu+ivFV0tiDJA967V
	qyeAzZKTcNLj0NAdzKKxQtXifZ8fkpwWScT1eVOTPZlriq+z50QzNbd2i1boQq6yU/Tp14iZqbE
	ufMPEk8dbUD6EMhv2D1b2U3bZcxUnycFsP5Pen90gXLYV5sUC9hqcvy1R+M7E5ShuoGvX22VLXJ
	9rkji+0sa/X+thLpFqqMf+bziHum565EcbtGrJfbsupvf6nvHtyQcmr4UIm7P0A==
X-Received: by 2002:a05:7300:828b:b0:36f:5861:69a2 with SMTP id 5a478bee46e88-36f729cf8c1mr6557078eec.3.1794044520841;
        Sat, 07 Nov 2026 01:42:00 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44a5fsm13217351eec.7.2026.11.07.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:00 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] soundwire: bus: Hold bus_lock when looking up slave devices
Date: Sat,  7 Nov 2026 18:41:55 +0900
Message-ID: <20261107094155.3951878-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-2-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-2-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
