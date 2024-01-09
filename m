Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010843C09F
	for <linux-sound@vger.kernel.org>; Tue,  9 Jan 2024 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="k19gLN6D"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w1.tutanota.de (Postfix) with ESMTP id 59F9DFBF68C
	for <linux-sound@vger.kernel.org>; Tue,  9 Jan 2024 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1704820977;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=ARlPstTmYk5JDbDp9TQBJ4E+bkETnjbNRgCECidGtRY=;
	b=k19gLN6Dk9DNCnsuGDNUMQHzXeztiMcPwtHA0o7qMieErklyBTgBRNhqUiodxXul
	4wImFFcXVz7+mDqwirYYs1pr3/msv3zGD+zPCMMVnqe89y0kQGzpDSLJRVQOl6ieRaW
	0rH9KPKQKJ1o7mryksGKPUJcs9N7XEsLoUJcntQc45etv3koVmm4kexNrev692cjYwt
	2PvP0Xa79gXLXvI3QKtxw1fAAvb06GColra1F7ZGyItOpzGQ4rlIkQWN6WHdJbzntGb
	Bn17OWa5Rsgb+SLnm7yzqEJQQRgLE2WIaBMfefT2iqWJird1fa2l5PqKMl32dLg8ziq
	I+ZmSJ6AVA==
Date: Tue, 9 Jan 2024 18:22:57 +0100 (CET)
From: srbaizoki4@tuta.io
To: Linux Sound <linux-sound@vger.kernel.org>
Message-ID: <NnjEuqu--B-9@tuta.io>
Subject: Unresolved Alsa-UCM GitHub issue redirect
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hello,

I am adviced to send you an email if this GitHub issue is not resolved:
https://github.com/alsa-project/alsa-ucm-conf/issues/344

I still have this issue, even with latest kernel:
Linux 6.6.9-200
Fedora Silverblue 39

In fact, I have this problem since at least 2020.

Please tell me what are the next steps in resolving this case?

Regards,
fiftydinar
