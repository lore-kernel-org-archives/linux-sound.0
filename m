Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845824;
	b=AI0L8Q0msrfaIwzTkSBXBQyrHnlYKKjC3cPoHL4NLY7NeesOxGwntv8QDKnziNxkcF0e
	 PmNxkhHii9veOt5UuvLzCHVwGYWx435eUG4dXjtaIwKDyaYTO62pbMEfetBzUNQ63t1Lh
	 zkLI8YDbHr8Oy/+crt6/11z/aWTpptQ/0xQMvck3SEsZudUWb2ZkKFgBYBROH1V4e325y
	 m0ug9kd/MNbjRX5zBUP7Bnv8viJHatIukx4yk7iILJIcXPYIB6O9M6V+CyVHzCMm9kSyB
	 4zsS7DY2xS1nCgJdtEL0UogJTDChCQnzhBPfVFxjuaS/QLF/hrOMR9Et7QkW4W/ee0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=ZlhXzeTWzTq2R//mGnwVAcDTTXctV61FwgV8+SnvDSGlNOdIjC6d1ytDkMlI+xOpcJp+
	 6MkEJIAoKRjrgSfBI4FC5kT1qVqkoBCiveQ2rS+IRgX6xSeBkqMyJ/x7jHtivFbVTfBJf
	 KEgLp2o57CbSnkUvCWJqnPAG8Tm5F30STokSQEKsow/SE+Qx6wv7A60IH3dE7gOHsqQkB
	 CBUZfr+fgvAW6NUqdiz1rYZigHjdINx4pFebtQbBhgQ2XCFQraCU/wH/K3E8q184yVCRN
	 6N8o8oPihSiZssxVc76XWWKIURncBiuZemFQOSzGUW4Pre3ARoXozV0u4G/qZKxfj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3IWROSe;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8008D606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 16:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8008D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3IWROSe
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so9599032eec.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845824; x=1795450624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=R3IWROSevYYlJCVMW7CgW/laiJYHvyfGOiL80q/i6KSOwTTyUAaziXf8UjGJ1oRz6w
         lHE6qnwLOByU1FqRGwzCngmLKdqC1vb59Ra1UuqQWdmOs14DdhZhTVH/d27jameyaD30
         suNwVuJXliRFP4QPgtxigHexgOWEHeR1In2/b4O9agsFPUoihs6yKj3vRifLW12lo+Bd
         wKObZKU2K1Zl6qTQ3Xeb7armaGNwhaMnRPIko/8nXYYFBES9eVG0bvhDRm3vSYzatG+2
         QtDTAVnC+EVgGvywlTxovlqv/jBfC5XabKpYcnUCoPkve8WznmL2wE5X+cxdAAvuMAI7
         NhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845824; x=1795450624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=nCD5PZTuYevprkNNAXp+1cfjBAKWLApTU4IKOIBdVJiilh7xmAzHWI50jquI0PHD9Q
         zxjBoUkkw7RYpHF5w9L/9k+j6hAslcZk0pqHUK/yuK6xahxlkRCdKKeKQG6rNQtY4gcw
         xhB9DEevqpxo6AjjeDglaVJntHBEAglbPGd8EV6yH9h5SQxpnCB7siu3lvNBd7wn2ImX
         ttD8ghF4bnqhckGe2FGKTN5INAaw51feMaPmgOkiW3Pk+d+ZyI+uAt4e6+2Qxvn1PvbD
         BmcHJXw88FjMfk6MKgY1v6yvOAvoGmxy3mwhPU6er8h1DnKEDDpTvAiD4x1Ezw45zkPr
         BTuw==
X-Forwarded-Encrypted: i=1; AL+hErGjApsHuQIwqFJhkrQo21oupS4YVT/kFzfEEje4qImfibzqeVbAnxXrJSNl4OaT8x0W6ynwCP+CTiEE4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z89oHWocRWIVnWoSf0SbeZDFoJer35Xrbq9xYQnvY+IM6VzEZcK
	WmPlP3IRGErf151njCDNh0GULDF00DhsZyeQtfcQSFVDXTxaW3YyddSw
X-Gm-Gg: AZFdTZcpGTaJKDQuI/xs6W7FZvq5nzBy7lVuMYjrpJueo103j4eLy6z4gndRqAqW6Sj
	STHjCFlOQAjcuiWJtfUgJG3hPcwBop8WTllbfXHF7Gey4oTuqyAzhFovzO7xYW2rprKUHqBWqFm
	nDsXFxQOHYTnq/RZDmRrL4drSzJ3Au3A9qqEd9Cjc8GW2ueGaLpKx1E4vdOQFNLHdZHI+r3XH36
	TiAlzZYTQoDuyK5ajL/KIutAJDYMeJE4r+TcfsLZ5RBTKQ9ZPhqnyjyZ86BtzrP5Cyedwknkeej
	/nlO22Wc4iGcoRGY8AlKYc/rA3LORyta6Wzq6WBbioNL0yXkAmHnUmNQkm+FN45G9Rxs8d57WVq
	V/7kQ1kPIJ/GrBWbcK2AUA4AXu0WRPNLPbj+CxGRa7KUQQcQw4HT+TlbXgLFVj7cWt8Wp7TtV1A
	DZAtFFAGYNT4rViGhZ3NweqWlrZiQsFfLqNJxAJp6WKo40EnxiV1Eiwor/6a2SjGUkcF38kWoQJ
	6jy9lA9yt1pRm/Hx9ks4akI/n2XHH0FLjv4rp6hka6/stPcbyvVcwB8hq8YeugRTLwk/XNU0Zdz
	cxgJx2NMuZR38ztfKRlr7LhIZQHylJaiHLMY7GGAeuYP1xpSCRg=
X-Received: by 2002:a05:7301:fd09:b0:36d:4570:a32d with SMTP id 5a478bee46e88-37963953f0amr10933645eec.2.1794845823588;
        Mon, 16 Nov 2026 08:17:03 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69867140eec.20.2026.11.16.08.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:17:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: jack: Fix jack control cleanup on error paths
Date: Mon, 16 Nov 2026 16:16:34 +0000
Message-ID: <20261116161634.2821-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733t0ye2u.wl-tiwai@suse.de>
References: <8733t0ye2u.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
