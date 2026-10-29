Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237607;
	b=XlqJSeUb8ErT9hMgM1apxyI79QKqSyqJTWfevMuOb91DHqwdDr/XxWJkhmVfWMMkpNyD
	 XEJKNZd+N5VdbPglArk10EJhe3e2l35gtU2LgrvY25tTbwxxq8EONcCadKKSE/W7BZl/0
	 TWAJ/UW2tVx1hP/rgOvgSdTaujY6F7QnR8jBYuFGG+WwASxS52ZBcz4EVIMfDnR6GErqR
	 3qaYlX9qbBCu0Imrs056bpeRY9Zb2q9IRqT3O6nskAce80LRRKO5SRrEFRxLhOi4duSat
	 rXNURbUPGhpiUZKkKYBxwHBwhGm+OwsUk2J+Amv0jGLLV/tsNeNCVwVcgo8bywj6ohw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237607;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 Thread-Index:Content-Language;
	bh=3xKQId8usu94SY0Bq4swNV4qyJkv3z2J03kzKaNzsAo=;
	b=aTA8GuLlT7dT51xAhOjpk7XZJoatDH26ErfXHaAoNqMAJFZJ0/McLmN7lxmtABK7v9Vv
	 PCF+1f+zhyu8gsVCmRdKndCPe7u/bOZhbSxS3C79LQ20ZVbNAFPcKwQZkfP4cd1FD2L6b
	 xYOzrtnm0xUFFy7BWf9FpzShZFuUmS2EQOOf0Rcff92I2wndVP8MAdO2nqlJglW7V6rIv
	 e1oCW6gBhtBNeh5fmZKgwozxsjdAOOuCryOEPoivnHTnGDkOKwBjcew0Y4B8cnpR2dVP2
	 69RAqKw0iinPcKK94czxImeDjqBjf7CoLXVHs7k3y1KNzMyNFd2cIomwo1FerQQ59nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.57
Received: from r3-57.sinamail.sina.com.cn (r3-57.sinamail.sina.com.cn [202.108.3.57])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5C9606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO DESKTOPQJC4P40)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AE2A25B000013E1; Thu, 29 Oct 2026 09:33:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: F977D91825B94355AC5AB166A6EB1C76
X-SMAIL-UIID: F977D91825B94355AC5AB166A6EB1C76-20261029-093315
From: <zhangyi@everest-semi.com>
To: <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>
References: <20261026064251.15017-1-zhangyi@everest-semi.com> <408aee47-19a8-4bac-b5b4-7be26ef51f80@sirena.org.uk>
In-Reply-To: <408aee47-19a8-4bac-b5b4-7be26ef51f80@sirena.org.uk>
Subject: Re: [PATCH v2 0/3] Modify the initialization and headphone-related settings
Date: Thu, 29 Oct 2026 09:33:15 +0800
Message-ID: <123d01dd6745$7833fbe0$689bf3a0$@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1nRXeYNZSoLktbTtaiQt+euVyuUQ==
Content-Language: zh-cn

> > To support different versions of the ES9356, the code reads the chip 
> > version and performs different initialization configurations based on
the version number.
> > To improve button performance, we've adjusted the timing and settings
related to the headphones.>
>
> v1 was already applied, please send incrmental patches with the changes in
v2.

But what I saw yesterday was that v2 had been applied.
The Message-Id for the email I received yesterday is: 
<179304576788.199157.7157888741242210309.b4-ty@b4>

