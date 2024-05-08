Received: from relay2-q.mailbaby.net (relay2-q.mailbaby.net [68.168.211.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33ED530
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 22:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=68.168.211.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205761; cv=pass; b=aFnPPwMDnwKNbd4RdA9GiZl0iwBFe6CwUmCZwBWQ0+KcgiYb8RH6jmWEDu459uDN+3VBNV5uOgDtPJzL9yR3KJ+lIu/7FQPPTkc2+/0O8mJ8UWlA2XdWjRNlIG6lAU/65ABcWUNAiqVBQ+B9iz2ORVM3bMjzsDlOs4NyUQHdp1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205761; c=relaxed/simple;
	bh=rkH+Na276qd0ErypwPeGqpGWaeBkpBw1Or6Ob87anOU=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=T+FFL0ndfdpB/23lEW22d9fEZCVqr/QFjMW//G3cajR97KxAGe01CAxZPZQHZNSHl5YvZrL/idu22G0Jfs1dhX0K5xn42RbNmhVz3BjJCjr7FTZDPb35GC/DoliafVxDBALuIOwGRa0/iMzHypI+6wduG8usyDMgDSnQ4ExJ5MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carsoncitylug.org; spf=pass smtp.mailfrom=carsoncitylug.org; dkim=pass (2048-bit key) header.d=carsoncitylug.org header.i=@carsoncitylug.org header.b=qTpUklla; arc=pass smtp.client-ip=68.168.211.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carsoncitylug.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carsoncitylug.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carsoncitylug.org header.i=@carsoncitylug.org header.b="qTpUklla"
Received: from ny.private-rack.com ([104.243.32.45] ny.private-rack.com)
 (Authenticated sender: mb22038)
 by relay2-q.mailbaby.net (InterServerMTA) with ESMTPSA id 18f5a3617ba000aaa3.001
 for <linux-sound@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 May 2024 21:57:25 +0000
X-Zone-Loop: 760dc79c3d153aede4cfe9428e6f01e8f4d871e75975
ARC-Authentication-Results: i=1;	rspamd5.mailbaby.net;	auth=pass
 smtp.auth=mb22038 smtp.mailfrom=glenn@carsoncitylug.org
ARC-Seal: i=1; s=detka; d=mailbaby.net; t=1715205445; a=rsa-sha256;
	cv=none;
	b=yl1l8UrBixfB8SUgBqivXzHr5SakvBnJEH0bRKnNBgskMxAXjaUH7L/0oQ4ZLe99RR0qUu
	+nxiPTr8CmXwMpY2cbeo+rrWNG0e2wQL2e4CY8rqbkiVwn066QIpIrZB4B1+RkkHvhoY+6
	Qv8qyevyQVEqN69QPXtUpehKsMMwLg22f9bWYU5GL83CG/IztPV6EB5xnRT2GcW3qPL9mP
	ElawxhcIyqmNpVlu95gtn9KHGhQbWCnxmKvaL4/C4usEaefUuy8TglEUljncvHWuDq65Dg
	dq1u6Se6McaJFT90rEAWbQBLxD8+M80mYwqJu/z+p+rAguaxpFlDssthvNSmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1715205445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=v+CzTPbQCnTpNJERjEZyRArLPV3YdUvVNerlGtyH0UU=;
	b=bFs1cxVxXU537dKv/ZuOh2XONOKyzQattqr5p406lz+edZQqnu8LrrTKERo4p6FOcwkduo
	O61MW9bIY14OfS7lqQSCd2udm6jEFDhPsy2DMgMSHUZDP2qigw4PkIxKc0mbv+h4qkc1mJ
	nCsgn0K6rPPhsEKTMCLj7bic4GoDtdRwzJ1lnVAgKdr5/zS4phOrFIMUgZTLXP1AmqqzfJ
	ZUSItkpiMTai5kg7R/GQg+XL8Lql9ESXmFE6+eUpq1YorbGGpj+lvZLkqGftciwLgYqvJY
	fY89hWJhcsKRVHzsWFaPHUnsontzeFfyJidqWUjJL1JWHBdU+1S9ywUDVKKcWw==
X-SPF: pass
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=carsoncitylug.org; s=default; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v+CzTPbQCnTpNJERjEZyRArLPV3YdUvVNerlGtyH0UU=; b=qTpUkllaIcVFQBN8fwjVJgnKiB
	mW1BEOfj1YTX6+PNaxw0++fifrrIYkT7WiqBwNTjQmvR/WMwQQxqWzJKysSzsjCxmU1tsOM9NUWFc
	s1iAGI1M2Y5kLtvekNurIBfUI/jhmYyGrU8En7SdtV5SeghSR5iJoKWnpDWNDT/roCOBeed8U5lGN
	tzCOtBLfX8wHvlo5ZnyT/o+fyZMkdgDHY2RGbBJnvlEEKd/Sm993ShM6RZJGgcuCzX7PfppWH6txU
	WMntVC6cr8NEFsFAw3CVvwUCEwLvo/FKYl35iMeMfqit9v3xk5iNugbTlu09bPZyx3Oad+FTGWM0P
	u2fKaq9g==;
Received: from syn-071-094-009-225.res.spectrum.com ([71.94.9.225]:56980 helo=LinuxBox.nv.charter.com)
	by ny.private-rack.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <glenn@carsoncitylug.org>)
	id 1s4pHy-000000026uL-2hNL
	for linux-sound@vger.kernel.org;
	Wed, 08 May 2024 17:57:25 -0400
Message-ID: <65e852df4a1897d6f05a9b712c3ebb7ed227fd4b.camel@carsoncitylug.org>
Subject: kernel bug?
From: glenn <glenn@carsoncitylug.org>
To: linux-sound@vger.kernel.org
Date: Wed, 08 May 2024 14:57:23 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1+b3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-AuthUser: glenn@carsoncitylug.org

Greetings,

Is it possible that I am suffering a kernel bug?  My  AMD
ACP/ACP3X/ACP6x sound card does not work and I have tried everything.

Thanks,
--glenn
