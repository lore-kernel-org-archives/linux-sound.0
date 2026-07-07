Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3023ED6F
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413946; cv=none; b=pYPPjfWFYv4j3dqaW0wf7NppshD+N4omv78YhbmnzISDwlWAJw+uveajWbLoJT85f/151PDEvAQn47gZnomKLffHea/ZkS6V6mHm9Vodv6mGo2iALTxTvOfIYH+czGa3lRrz+J/UIlCFytZQPXxr2dXMBEvyhIVWiQpZz3t8b7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413946; c=relaxed/simple;
	bh=rf/17gnaX6BVMaP6/wBzL/dOi8e4BdWP90FhBRVBukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3u8/nYb1FqdRzJJvHNCBjq1jxFfjco5NeAM/fbO4/lq6MrsMWquUDhVcg50RAFWGt9r/uqQrWxjr6hPQngVvuDxl1RhH5jPkWs54jXxwQPs8p1egNtaswA1LeUC66BcDEf6CuqWFxNpkfV52Z9aFCGZQkAsnQFV0ZhxmnGJ1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvlswrJd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvlswrJd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-385b78b44a0so2159668a91.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413944; x=1784018744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmBYS/wqx+QmmWVhLytQI1ddkicrGHDFtQb/fW5oMCk=;
        b=CvlswrJdaXX0AzSs56JcVnsxvQy0EXp82/nxI5WHpO9gpjJX06bWsSIZBUOg63lJ3m
         tLCIa2UFLuemth3Sdf3dqLN2pg9ZSG46QM7wyuHGctpwr0SOOMPccovO6cCof7YPjNCL
         qJXcgeJ05IWC8/Xe5OGwovpZD46guOTd9EMeZqAp7BvBknjAfnySNgOfBVeHIwzK4sGK
         FO3qIaUsAStNMvjb6aLw1X/GzLae6M5eEkQjijQ7OM1Mya5jtYdaiymPp7yz5dL/ZZ3T
         UKtDo47pGuXH9pXxwp7oY6Cgf2bb+44OUVltcujDMGL4aMPLSJLJhyZnHPQWq1ijpvmB
         DOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413944; x=1784018744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmBYS/wqx+QmmWVhLytQI1ddkicrGHDFtQb/fW5oMCk=;
        b=YY7N4sH5O8PnfQHMfSfikeMhzgHj7EkwcgCq4u/dAu1thBt4uW1mL9T6W15jUMG4Xt
         bmQwSvM5Vm/HX+K9sD4ouFgshUmwn5TOrTkvSlCUw23+tLj8wW5zKYhEPHO7mP0ERt+N
         Noss27FTTjvyFLlc0tuSCLCOjmk6aQj444IjhB8+FO++E/lnH2g46Dr1DAritQ1qwUpY
         EU2rpuaPnzflchkqFf60fPp5s26PQw5fT+aXfOZAmZjjQBSCzPadQIuhybgPNZkWc9yL
         pH6OvPVK2f9uKG3dil+tbH2kQRacC5d3l08+hcIUX6SclQ5TMq4+WF9TEwlzsccOOhgW
         BZYA==
X-Forwarded-Encrypted: i=1; AHgh+RrUtoA1nbhCV+/qro09OA+SAorVb86tXWgDNTfFgz/39kShIRbC85QdE+OFEeh37m5Nh292AuQ72yq1og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB7JkfLaS0vxKoOsfI9KWQXX4CF0l34Q+J4WgOIFE0lt7nA8Q7
	TcreLAG00X5TLoJ8ULNN3f9tgd9wPdhco9BZ1wjsbMD8byQNVFjkvScw
X-Gm-Gg: AfdE7ck+TcMj2eg6gYntBmYFW1N1yQkUA3Apt/YtFrrzRJyNovFaB6FEedZ6GTVqznI
	mIS98Ltt5U+4BUVBlQbm2NvF2l37YcPnzF7q7X3gs0WmIA4GdinQWCfaz6AuzSjg3mXFl+NKzHu
	yAAB67OtTk/7URcfJbZpkD+Skx8+iivPosz2OOqpWZK+6poFy5tp4rocBkKHIuNVnb+uP79HCf2
	qIatu0DMwipFGrzY6JP4BudIkZIDw5v5sG9NWKHT5nOkVVniYsn937tbcNnYayukH4QJKVqSxQ9
	Gn5MJSpM5KgZ/b4YGomJNdUFhGfiIu4v3pGAAdvzbWT7xuK+HaKNpaL5EqiprmsEKO6qcqQ27xr
	PHg78/bp/YqmYE1wPlb06jxZijfH2nqTwMafIcrhIrGDpb6yadZ49Kit611gincV5m4OXLqJh8/
	/Sw2Q8XHn7apa6fHGR45XmyW/jocl/XOWxeLboQ30ckntLIgc=
X-Received: by 2002:a17:90b:2c83:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-3875576870amr4533604a91.7.1783413944390;
        Tue, 07 Jul 2026 01:45:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ALSA: info: Return -ENODEV instead of -EFAULT in alloc_info_private()
Date: Tue,  7 Jul 2026 15:45:03 +0700
Message-ID: <20260707084506.718583-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707084506.718583-1-phucduc.bui@gmail.com>
References: <20260707084506.718583-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in alloc_info_private(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other -ENODEV path in the
same function.
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 54834dbe6b59..3b8ccda04e1a 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -78,7 +78,7 @@ static int alloc_info_private(struct snd_info_entry *entry,
 	if (!entry || !entry->p)
 		return -ENODEV;
 	if (!try_module_get(entry->module))
-		return -EFAULT;
+		return -ENODEV;
 	data = kzalloc_obj(*data);
 	if (!data) {
 		module_put(entry->module);
-- 
2.43.0

