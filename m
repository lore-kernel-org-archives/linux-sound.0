Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76826A1B9;
	Tue, 18 Nov 2025 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459061; cv=none; b=F42aZ81M0wbfk4MgxdkdFUrprvU7LfzuSm2YXcnt50Afzxxj/cgDmdyvhnVfwm6Dds3EMxTgmGqP5lHRenmbNnvvBepmT/vncAq+PDpMUe3G915VnyMkD8ePffg6631iXuwCrjCJLZRs0nihO5VR5lgfjHCCFiwtMlKpoU37s+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459061; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hvs4/o/q2QeIHi+j056B/hEjhG9w0K1DZainW40XfJ1ZsBBA9N3SeApuNBf2xcsqwaPN80kx7nZwZxWD+SjFEiNceBHdZsCt/hHNNLg6Wtl1US1wwIStlrUBXCYKUgAPe7cWLgLmA3K77iWild0CqRfYtO9WOcLCcl0LX96ujGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ebdx+TdM; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ebdx+TdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=47
	DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=ebdx+TdMuNPZ2OqJvR
	3G41IYMvV3YCUFAutxia2QbwybLb0Xxdv5jDHK6wk3bsID0mgBqq1UZWNiNeXec3
	j0C1v+WAHgpx9phqE/5GkZed23SAzEdKBfulAVavZzEhYsIAFVjhpIfjyMI+nTKd
	m2JvHr7gpDnkf0wxwz1Q8kU10=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3B3nXPxxpUPc8BA--.9895S2;
	Tue, 18 Nov 2025 17:43:51 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: tiwai@suse.de
Cc: imntjempty@163.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: core: Fix style issues in sound/core/device.c
Date: Tue, 18 Nov 2025 09:43:51 +0000
Message-Id: <20251118094351.55986-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87h5usfx3e.wl-tiwai@suse.de>
References: <87h5usfx3e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3B3nXPxxpUPc8BA--.9895S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4Rk8n5UUUUU
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/xtbBcwQJAWkbQA34vwACsF


