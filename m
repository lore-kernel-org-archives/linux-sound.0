Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896911;
	b=XeXx8pcXywNiSExTjP3IZ/iN58ndZ8QXSw0uZ8t0HEpcr9yY2SzIbZ13SJ/BCJvUur2t
	 3fVGQoQxJe7yKWlIjwiLteI6N3RWpfjmu0oSJ5oaJqP/zvLMys0nG4gQPzHrXUhltMkF0
	 Eyif2bqp3RoMNWBb+OBD9FRE9Uexp8+l3gI5B1DCQWlVKf64H/sbV4AAA8EK4IpKJtM+2
	 QanJ6X/YpHmaefm26oK/aZJr+WpIpLrvqJVCSc/R5PdjsdpjpQGCwyXuML9X/umHaO470
	 mMTPJD1IADvQZSzJmYDPw77fNm7At6mcBvuFy20wiFlOK6md19C4HA61mmEea6RPE+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EndUYlnDNaPj32UMOjAC//vbSb6zAqxPuHfiKHMO5DI=;
	b=KADbYI0nOW0k+7VIz3b4LwYhVtny48QoORn1dt4herj8BXYp9BPDhQunSXtt72h8Zrpn
	 y1tMx4Lx2rAH8TfNSa9KZAG858AgSqd1Ett/EbYAmOfsr23XPTJmVp7RjJ3rwY6RIu/0M
	 KHJKM5VTtOLUJJurrPmThbLTRhOEoFqJuVdjoXXCcALTIsZD7ub/ZQkNBOuUb0FYOWnnN
	 LcgByQBdrWd0tQ3tIiZFi9cALsSo/EwpWCfc+xYM2aJJqdMRjhcLB3HA2DBB2q49ipIfV
	 0jAyNbKL5+KrDcj0WcBxM/NPybLb+TfGSLymSpJfg4PadtvhSRPm/heLb/sGcDYmjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="upGkA/VO";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CCD606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 06:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CCD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upGkA/VO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2345401eec.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 22:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896910; x=1795501710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EndUYlnDNaPj32UMOjAC//vbSb6zAqxPuHfiKHMO5DI=;
        b=upGkA/VOO3mL3jxIxID4lXiksNnJ9vCBXK94U7h+6rp1m1ARc+F9DyzdzTVWhEvKoa
         Vfdlw9dLY6Rsixv4M5PCivcrlkcsD2apWetKFr4F4SLBtdY7pXSCT/34MTH1UaANnjvA
         GYeE7wqSpFpYUE5HvnfNxsYE5wFc035yIinyOvjC+PNom6k2a7ToNf0Vqq7Hm+oCY2WO
         PjneAsrGOZQHMkYp8kBXM0SXu0iH8s0nQawG9KYdWfebKtPWBUVL5OhLHrLSg5rk8kRE
         h5G7Y+HAE/kvsSLTkfBGdNlnRS/Ys11s+Hzj/zXmrAzAbBmP1cyJuKKchiySZLWaeieM
         Nnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896910; x=1795501710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EndUYlnDNaPj32UMOjAC//vbSb6zAqxPuHfiKHMO5DI=;
        b=QNHS4tHE4sLnnHjfH/a6sW1p20i7SFQJACr1bQO5+bJvTwNr0xMeg6fmro8n08hgE/
         iArHLITq8vjI7iwq1BPegoryKWeoaU3wSeDaTfVcOURpwxC+HTptpYGnIZ+9jUYjbYVD
         aBRAydzNkJzyIn+YcJbIgUMylngMBUngJDrz2zpsOqa2/uuiWST8kmVMZtxfvo9ye7wV
         +maAfIjzgW4CGahop8Dm8ZxKN/0A6jj2n+XGVloRFJ6EZs3X611E9tH0YkKWrzegxojK
         5kzO4yxq0/naNN42OdjIJLziK9l9jUC9DeOWjpJ28kBzC1HfzsdyLbVoNDNJ/nmOsHWf
         uiOQ==
X-Forwarded-Encrypted: i=1; AL+hErEsZVIbSfA6PavHmdDUusHhnstK41DIohsDp/5vu0F5wtH08IKlnJF/DQNbclY2ZqYld+FElgBg8j9SjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z87ftOtybgJ6LVNPT4YTEhQkRlq0dwRg5Jqj5SeWHW1PCSFQosx
	tU0xz7LZ/CCG4uEf39E4wvlGmwEo6RBVmtB15ewMwMjvR/R2HM7WrRxIIBtOGCTu
X-Gm-Gg: AZFdTZedAJacN4B2OBjqG5arrNiLbVnYc9CYva3w6x0RTnudqLAl7059fHrMZmUess3
	sNN2ejzkUhR9tHw7wwQaoJuuFJmIfkrrRgLhVmV91PDvfvtvWAZxCLKg95BtEepOuiMvMTiOxUA
	WYUV2t4ucjog9CTbHVKk7W6PyFguiIE18sWn2ZlCeDTxJ7YakW2ssulbedZPko11Pp+Ros3nvo8
	zL8W9TxlMdcVPSqdhrLKwbbxeF3QkHWVKP4xFNYZ4ySQcOlnAOrO0a1+a1PTXkV3LiCQUkLt9AC
	Bafp7VazPezkUcVaia5CtXH1EnQZczXfNxse3/Sme7aPMAXtHlm2jCuugzEmg5x9hsDF9IMXkOS
	KbI0VCN6u99uiQqJANTzs3UyiJS1rVF+Wk+CPfxS6kqu0JSZIRkfZckcolkrZypjIF+QhrShGTm
	JOPl7Mj4HzWZEW8kijAhUWSIB8bmfvXwRry+VFzVlPGl622mTTs9Hk9h6TB6tATAmiAt5PpiNEx
	FVOEjCbeZXP5j4s/2552r2h80BEC8QzWbuCiygT8tnBmlKInMSwYsgu2JBBITsITk+kEQLswcRj
	Z0kpDP/Giv5nhlNRZcu4vv+nQrsqQdqgjyupcBtZr9OVICGjAhg=
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr12811480eec.2.1794896910148;
        Mon, 16 Nov 2026 22:28:30 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm43855185eec.23.2026.11.16.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:28:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Tue, 17 Nov 2026 06:28:08 +0000
Message-ID: <20261117062808.2807-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
References: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
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

Thanks for reviewing my other patches.

I noticed that this patch is still pending review. 
Could you please take a look when you get a chance?

Thanks,
Sreeraj
