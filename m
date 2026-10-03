Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F6450909
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791053106; cv=none; b=EY5+C15ln1t1wfMiK8uXezursYskAe/0ZnieDvdQmXAcvfiDZ+5h+z1UUH9wDovYsqAYmqLR2Wmet18Nej0cI+l5WkLL7vbeLYgAfdM64lvw6msaFNSm3xL6Kb9eUpaAU61MfgXbr7df3rm17nbXLXEUGWcGg9LcBPaSGRFuTlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791053106; c=relaxed/simple;
	bh=zkssaX7fnkDc+x6aCkdXY3ObHAFxkiEVjiZd3OTMEDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5GLzG0K6oL1qRrm20j9hrl/tmaGKRc7fPwotcAkd1XjiOazpBHO4vYbJYtCN11TnbreXQyeOHeIboEL2nMc5UKucWyZohysbHeY2D03iX7Tdz2ubZHH/6Qg6u+1a5DUd+5lK9SxVq+5eue6E8rMSXlJpXT965rntX5QtviNV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLQeRUKj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLQeRUKj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so4110365e9.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791053103; x=1791657903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djtqvvNIWPRflD8Kc+E4AOFA+52E0tOwKn2avDlsL70=;
        b=MLQeRUKjFdDQnuyu0HBn7Dlza7jShYOsC2KPpgjatvc/DX8Saits3acwGLJuF7msim
         4r6NLudViYA3IjMMxs4xRTRH1LjHI0JKUzj6suoYPeHLcfi3swx0ZLznrcctTsho/Wy3
         8zsmJnVkAI/PVqenenOftqkx2a5pZcN3zIHE1bW337UwG1ctLZVN0J1WSbv3V3bfI1in
         iZgo8aAbf9fEMd3IBmgZAySCNds/Xnu2Ec3xUZ51n0Fu/ZGv+ARf9LR/ykDNL5FyC7ws
         PFrWPt6mrmUu9z2nbmWhrG+gd+c04CfHhlMfKGP2lWP6Og9uejtPbjK/pFJe73ZuLaM/
         RMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791053103; x=1791657903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djtqvvNIWPRflD8Kc+E4AOFA+52E0tOwKn2avDlsL70=;
        b=oQfhKCKHtzQuFRrMITiGDIwxMjWgY524Ke6p2zB3YTaXOlADzT6anWeJPwMItoKfkq
         H64r/LbUkM1GeZYJ2hO1eDHMLuFUWH6niO+NpPa92ZF+Q9YtEKj4cSkv1hdhBhP13ke2
         3gbSfhLpB19l4ro4PlYBdc10LmvR4AZbB2EZBijnxgP75gDQugqwpLRH+xTYftDXh+At
         MgbbCHMWzbElbdZ48xAcJKyPq1OLpjyAXjfAQYJlk4dK2KJrqxnHXjXJH5ZE9g/5l7ec
         j6cd3ycdoMkcybqvLoanh204QT/3kv9mpaLhW/clVBMaoJoDYo4D9FkT19uUv3PTk5sL
         Zvvg==
X-Forwarded-Encrypted: i=1; AKwUvBxEpVdT+DHU6lH36YxdUMkQ2TFv4lKsQvuVyf/OIuO4/XHoQLQqvqn1yzgXJAersZOF+z30kVIzZt1TgA==@vger.kernel.org
X-Gm-Message-State: AFuF++mjLaoM1O+T5UrbexgFCTckOkhLbNVRIgi8uQSZ861ZUGAMEQMo
	iF8ZuwwujzP1BLZV7D0Fgg2/qVjMMV7E5375OvtCVLbt7TLOxI2aiyhQ
X-Gm-Gg: AYBFou07ZhYfCrnX9OUhk0VPDNWkMmXPoSo5u1r+bna58J7/uHDCJ7g57JsXqNy8GTO
	E36B62VCrXLdXpuenTJ3h67yFplKZn3ST0ofGzLqP4Xt8mviWm4k+H6Dc1CGWffMLAtrv7LBaml
	36rLD0v4xxZAAT/OPnq9oz/qm/3OCqoZqLPl1EPOWNEmibKS4XCpEuPql4gxcVfpkOQb4pnvg8U
	QSIv0Ey05g3OMuvB0goQMyScq5PZXdCRbSUk7tO9XtilcLl+eQqBbdzdrPmredXSskSH3ieTt18
	P7Hfp5PdNqiOCGCxXkWeplJrVys29vHxF65aNwN3pr4u19FlDfN1BZ5ZTU2leFvkxPse0WH2Zx8
	+jdqboYC4Uvzt7oALXzt3EwM+jvoIFDmI56co5CR9Neyk5BSUtkaWBfaVUkz53mZ286PHgtiff7
	ApQP0fHYtrb6foG+4624ZLWMDQLlgzFTf2YL/CReu7aHrBxb7GMSyBbQTq6Q7c8+TlHFg56RcGt
	kjOc7e5z4bfBoRsx+C3WlfZyaCKS/PDIBdZhi73Sf8Nv6Oj+2g3qhqALo/dsz9okbljQsk=
X-Received: by 2002:a05:600c:a404:b0:4a1:6af7:9c23 with SMTP id 5b1f17b1804b1-4a16af7a0d6mr31350755e9.7.1791053103279;
        Sat, 03 Oct 2026 11:45:03 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm222261035e9.13.2026.10.03.11.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 11:45:02 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] the Topping M62's vendor controls, on the component framework
Date: Sat,  3 Oct 2026 23:44:59 +0500
Message-ID: <20261003184459.35138-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930213322.32454-1-mikhail.v.gavrilov@gmail.com>
References: <20260930213322.32454-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Superseded by v8, which moves the controls into snd-usb-audio and
renames the HID driver to hid-topping:
https://lore.kernel.org/all/20261003184217.34671-1-mikhail.v.gavrilov@gmail.com/

-- 
Thanks,
Mikhail.
