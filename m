Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4534D3B0
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965788; cv=none; b=B3MjdhJaD+MHuQVJfp27Lzgdrn8o+SxYD4CYGhPfpLf5HL0/HuAgGoRYHUAPVlWw9QA7ISvZcRvT/CXxcUgACZ+TV5DFbaAexbJ/NfB+4GD7mo74ob6gRjGHTOkgw5O7+EV8h045krjtTZAELzwqLeMMl+WXVi0x7Dv/7FAfGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965788; c=relaxed/simple;
	bh=YldxbNicJblvb32ULDQbbplzk7U07Yt9z2N6JB/NM2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2pps6NnNmnQlS+BkFehIyccVSkkAC4B6W9SyMd+MmhF0sa6q3aZOAZ2ewB50EWQm9n2S8OtrS7epR/buHX7ocbDbentqNrhiXwnbeHIHS7CkUD6WHq83BXS8Sd4y5+cbl7TIEee/vR62sol+IJ6AFWIpHpag7if7NPPq2+w7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GObgfeAu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GObgfeAu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kl9u8lEkfnontPUTPHtNgfzIuRQKd3RWoqHkElvIFA4=; b=GObgfeAuPiz8Yo3SwzWsUWEhiP
	a4MsHKJCHSlGzEKstiYWBLDGvaEjSIGFfahZMLA4JphGx0nXN3sCpnO6Xkr7uq1dyUCnCwpChA9uO
	NaV412zGuPD6tdnWNkMjmMzLTWpLL0YFa9KRADYNStbEQoT1qbpIAiCcGZ8d2V0hEz6CzE/hAfakO
	JO7A0+fbcr/DYh3LVlYrTySNrBNtRE+1o6px+il9LwbtfIPdOZC9EyMt6VJyPJqfTI6RZU3N+7Amd
	vFe5PfH+cxCa30GprLdSX7CvQ9lX4e9ejUKfOM9CLZCUS7wcIcQQe+JUZXi75oxMFnA/lVzzxoDTB
	F40ZqMPg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKzh-0000000AAVv-3O6J;
	Mon, 13 Jul 2026 18:03:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] ALSA: clean up kernel-doc warnings
Date: Mon, 13 Jul 2026 11:02:59 -0700
Message-ID: <20260713180303.526409-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[PATCH 1/4] ALSA: ac97: use struct keyword for kernel-doc comments
[PATCH 2/4] ALSA: hda: regmap: fix all kernel-doc warnings
[PATCH 3/4] ALSA: firewire: fix all kernel-doc warnings
[PATCH 4/4] ALSA: usb-audio: um144mkii: use "var" keyword for data

 include/sound/ac97/codec.h      |    4 +-
 include/sound/hda_regmap.h      |   42 ++++++++++++++++++------------
 include/uapi/sound/firewire.h   |   24 ++++++++++-------
 sound/usb/usx2y/us144mkii_pcm.h |    6 ++--
 4 files changed, 46 insertions(+), 30 deletions(-)

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
