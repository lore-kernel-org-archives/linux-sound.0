Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637814;
	b=rixpksdnaIoGYfu2PFk/G6Eq6OtIPh6SfLwttS0gSh9x84GpA5dcKt703ck1/EdkQ2oU
	 YVk3JxSiYvGoRdb+/lmyCioHQTUQu2B4YJ9XBqo2dTfjcosscoBptVn8lYEuDYK+mm6pk
	 e+uCQ5fyT5nhV8bdCREKpUgfyGOy+7SPks3gm98U91gsWAW5muYW/EZ61F1avRUCYxxj4
	 ynRu/aQy8tELvAA1ztYwUlSPHlaEU96S6boW9EZtnu5Hq4MBNepn0Ud1OfiDGHkuIbehY
	 hEP8frVzBJ+GGqgea2UNtTGwcqu7Vn+V4lXl7XcC6SVsIzqYPXjM+nfq0VASeYcA4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637814;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=knUXtEr78JThYTHf9jRWKMoVNTmgw/Ro0spAg0tp5X4=;
	b=JqngOvIwdDKQLJtNW8Dfga6gxcUr6jM7TVTSfGw6eqbQkGyGWlxe4Ju4wK+2YcqLQdya
	 1PHWdIX0ufJmwyZwN7EJRZa1qJjkOhTeoSgCphMDbMIrdMWcf+rh9Bj+ee+/SIcg30jVk
	 IOu4QlcmQXhwIkRp3CZrLTNX579ZwaGeJo9CEkzg9tt/tS0fmXKxnWa+Rb4Z8DHApcv/I
	 OfVpDq6coySTY0PkLViiOyOnqHPQUhJ1IKkBYa5T7TLpIWxw/aCv6+soVbiuCTOiu0MVT
	 hWNd+8TZH/Zy9Y7KrnIMopAYvwU+2YqQS9JBMxkOR7X58NfnoCBGWyKlMyBLJhPFpRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.212
Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86695606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86695606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6AD97B6B000010EF; Thu, 22 Oct 2026 10:56:43 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: B03018BF632E4921822CA21833D5DD67
X-SMAIL-UIID: B03018BF632E4921822CA21833D5DD67-20261022-105643
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com
Subject: Re: [PATCH] ASoC: codecs: es8375: Modify Register Configuration
Date: Thu, 22 Oct 2026 10:56:42 +0800
Message-Id: <20261022025642.24129-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261022023336.21653-1-zhangyi@everest-semi.com>
References: <20261022023336.21653-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Self-NACK, please ignore. v1 missed es8375.h.
A fixed v2 has been sent:
https://lore.kernel.org/all/<20261022025309.24028-1-zhangyi@everest-semi.com>/
