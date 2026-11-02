Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634077;
	b=Qwp9OcmYf06owYeUvhCAkefJ6fhZgdLHxaLHbG76mVPyeDQtK3L7xzBkk0bPY21xbkc1
	 jba/uC+6UHKuuiLAYvwOe4Q//x0KFeUHE4c+BMqOeFTAySbf3OTHM7/X5Ws9vp46MqGn3
	 0sKu9eDu4IbRd3AzLbyEVFhvk+ZYGB9sh6Elpj3Bdo7oka0bKbHpy2tkhjoz/CUH7cEGI
	 cDYGjUzcIwZvSVs7q1ZdqnFBBMXlr3Sfy/NfJdHx+HZYlK8ZSjmPMMWMO0Lf2qH2dtKF8
	 m2R96Wew6TqcfG+dPCRB2qNPWt7+lzbZ+WWsv1OavvO5ZG1w2+gTkkHELO6vDCyv2lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7UB52tVNDDfF5HUvEfmsYcxjZsy5hBD2OO6zm5qdm2A=;
	b=vaVXCroZLqAUdKGQeUsS3rNT3wTt0K/VL941gH6MS0vyEqX05Vuvt41S+HWpZE/iCxxy
	 LirEPXQMwtljPOyz9UCrFNVprJTvCFsJL1npMnc8rNF1htaA2EcZqZPj1l5WcDspEdeLo
	 5ErlYH3jx4159BxbEK1mRgGf6bjJPJ3/oInwo5hIPtnAs9Xtv7bzFHtMxs4JStOZD/Wu8
	 T/RznVKiSe7epbFcelC4pELineURxk5rRaB3b6nNbhFWGvVB1zD5gF9i1l4CS58tudgiT
	 CquM/3ebNuBoHLThstJIbAXIiRgXHPK2QLsnJtycWGyRAwegGrfwyBTUJjBKiDUFFXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wszTJhyb;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF6607366A
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 15:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FF6607366A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wszTJhyb
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2776407c88.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634076; x=1794238876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UB52tVNDDfF5HUvEfmsYcxjZsy5hBD2OO6zm5qdm2A=;
        b=wszTJhybx7K2hGSa67IFsU4dwnaBhboW5uoFNLHduVtyv6n+OZmw7RhhhrFphmmH6Q
         5zbSEoks6dUmnTZSn4Swhrby7gin7+lyl4Q1jFmUTIL59Onz7Z6aUmTXgmTpj6jif36x
         Lk2XiPgJVT12sal/76UkARbD4rxexRXn8mXsamfcw9+HfaZxpZhGWL0q0aJStmEXyDPQ
         PYbCOlgG1d4ohRHbJr6cvQR7l82KzKZFFzzsT1szW5bNWh+fVjhlN0/mB8jar2lsSSl5
         vLG9MhvDj1GojVwArH/lWw6QFbATkcKX2DAAKL4ouDErv1PuotXTZ7pORnqgWYd1/Ka9
         qJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634076; x=1794238876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UB52tVNDDfF5HUvEfmsYcxjZsy5hBD2OO6zm5qdm2A=;
        b=2RUeyg1PtMFBcg5rE9jV98UPzwX1nB+qam4Dnx+UEqjEN5yKIIxyYTm61ZJ4UF81bk
         Wyb5jb0HFHlhDrxvGjnKCD/wKnO+UIE8gs5mjvg7WlxPLlMQXRvP57NUdU6iPTVWVJXn
         XGt6KNQqkFfqkDp+nOaHqgUEjF8TDTPOiQdNw7FvrS6lRpFUzoxXbige3wzkw7RpNIle
         QyR+blMUn0rV41lKuhiHZJ+dnJooEDHbn7Hqc7RPf9IEN1n35D/il7QlqQUUzQ/rVl77
         SrAoJaPBsHK/ruRVFZmgoeYX8bY3bHQA7xDJqZJYOwTjx9ILXyxEPJMdYdOuRyNEcQvL
         LILw==
X-Forwarded-Encrypted: i=1; AKwUvBwx32IBQpdCwSgINXu0cioj+uYHmafIFdOBhA93Uc5duthlTEloz8SpI/VOu/64kOynY0uWUt9Yx5icaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+jKRlRFCtpzHT4dkCF+hDKrqHRSsxllXapi5SVbWz9wvx2200
	eud7mu5Uuti7798eSiyCG2hRUOUbZgfJ7+mi+ggZZi1NlYWQaYI5zgws
X-Gm-Gg: AYBFou0ETqGJ6lRSxgQwXSjQHK9dpPY5XD/VlLaVOGMx0BtDvnVQsJi7WW8KGzgwlhb
	q3mBtUEG3pDQkAIvBQtQy/c9QScy/Yw8losYJf97UhRG7asul9A5Hx6RA+JERpYXw69fqdlO73r
	h/Y8CeB9eQ1EFd7PfT4OzGlakeXXEIS7lTZf/UQGbZ7YdYz+QXTZ4gOIARFbviroJJhZVz/JBTx
	bSClSVLSkVbtU93e/Kj9PJn3y+Qfv2j1w8hM25CD+2kqk4zu1/pihBiIlwNttGLccR3HJteQqYh
	k238re3zq2PObf0MpfDdXtuiYtdarewOCutTHLiabU1z9s3rK+dn0CczK8pXxR7fpxvstLskjy2
	TCcAHz7Tw5GwXFFVxB+nJ5ScsIHh4W1b1dqsao1IuleiVazkIplphMOHBlHwva644F1LaiIPbLd
	O/YtvtRDssz3p4xEu6KbigYuQcW+Bdb5lG8z3j0bTQNbO5dlAuXbjVwhp7z0eutudnV0r9RKdiK
	2kitl2OLBRjPvxn00kW+gXXneC324E8QucwqQm6hsOEqRBmlG+myFIDW288nX/CRsMyDNmllg9r
	wNkOxQwcCMn5nPSwehGBaoVy+lV2cMieq/Os1b/Z12bEvYRLy2k=
X-Received: by 2002:a05:701b:2816:b0:144:e246:a0b2 with SMTP id a92af1059eb24-1ac6088a458mr15229325c88.44.1793634076329;
        Mon, 02 Nov 2026 07:41:16 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm60443825c88.7.2026.11.02.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:41:15 -0800 (PST)
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
Date: Mon,  2 Nov 2026 15:40:43 +0000
Message-ID: <20261102154043.2712-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87pkwn8ebe.wl-tiwai@suse.de>
References: <87pkwn8ebe.wl-tiwai@suse.de>
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

Thanks for reviewing and applying the patch, and for adding the extra explanation.

Best regards,
Sreeraj
