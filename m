Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4A2DF13A;
	Wed,  1 Apr 2026 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062721; cv=none; b=gdvUCeNKnAaitnG1yJEhE0vUMAixDs0rwqUjzihtpPKOd1ap6/1IJD95YtXLtH69+uh5D+FZuhpLsxYGzHBor0U2Oz7mzhOYp9zs3lIAPDPm1gN7fjz4h6UC8SFJTbAu/YTPPNJn5PNBBtnSrc8OL2YQX1IoGjFfuHwazzYWkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062721; c=relaxed/simple;
	bh=a/72mLMqhVYv/qYhbRD1xmBzwQEVf/RDh2Vh5ADHr0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSDBYGgTWragP6H7Ny+l3naZ9s+AlK5gRO+SP8Xy9UFfE52sedng4cDXHaQ/afNmACRjiJ78grh7YTNiCbUNAcZ6AN95GK6rzzm4pfUQxpCBnQO+gmA/0PD09gojUjAbtLxpH0WYSXzSzY95BZLUdW9CW8SD24oklsc01NMr3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9auR+8S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9auR+8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA92C19423;
	Wed,  1 Apr 2026 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062721;
	bh=a/72mLMqhVYv/qYhbRD1xmBzwQEVf/RDh2Vh5ADHr0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L9auR+8SFhSEthW/BMAg6KJs+uofNmWsU3qYN8TedksTlPBCLm7AI41tlUe8Y5Ms/
	 hHvhc1hlkuyJJRfwCKzZ+4zkk+de18DYWbN5i0oiRk+ZXdSlbi87PfU63qg12Vc/F5
	 CmfD2ExxEeJOju98+gIOt0YSaUyl5+UUuZ6GxegMvNJtiQbxOBdQkxfynjwLFF0Y66
	 udiq6xabwQoPNv92Y+keZBES42dpGuTAn/0NGjuV7QowwvqgfP4EwuU5I8c3YnISdz
	 KVZyecBbSjzp6S2H/mEH9hkQgPQrQ5HUZakFbDZEV1qyBz6U7C9d5wuXtEc+AVWzex
	 96BVZ+BvGGtmg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 01 Apr 2026 17:57:34 +0100
Subject: [PATCH 1/2] ALSA: compress: Refuse to update timestamps for
 unconfigured streams
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-alsa-unconfigured-tstamp-v1-1-694c2cb5f71d@kernel.org>
References: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
In-Reply-To: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a/72mLMqhVYv/qYhbRD1xmBzwQEVf/RDh2Vh5ADHr0w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzU68QuPimCRzSjkWFepRupiIWBLCYtAaAsMjq
 aHhGovrQ7WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1OvAAKCRAk1otyXVSH
 0MrwB/4hIxw4l0vmQs0qSudJ3/7QDMzfVL4XkjCKXo5B5XP5O2J3+ECxhgLnuneQ1S4drDoqjLZ
 OCdUGwbnGrw24VhuzWNL216Ubu+yty0WCUQPvWglkSBqrxCS5DxS9jT4jSHUpk1Sx4V4yoW906N
 wsvqCYuwiEPSuAfqO9aRxPZTRZIOglnXTVqH3hmoEuxB9xgjnyi04qbP1oJUdPbwIplNjeN4eCO
 Xkz07eQTcHqOVxayHylN75Mq6bhDKikUn1koHxwqa0OKoqLBhHuLsB6r07r29c1fl6tJOPxxlPD
 v7EgakScVuZFtURN6ya5VH3ggCbGAmF0eOyRKjwmac1K+MNm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

There are a number of mechanisms, including the userspace accessible
timestamp and buffer availability ioctl()s, which allow us to trigger
a timestamp update on a stream before it has been configured. Since
drivers might rely on stream configuration for reporting of pcm_io_frames,
including potentially doing a division by the number of channels, and
these operations are not meaningful for an unconfigured stream reject
attempts to read timestamps before any configuration is done.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/core/compress_offload.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index fdba6e4b25fd..67b3b1a3b526 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -192,6 +192,14 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 {
 	if (!stream->ops->pointer)
 		return -ENOTSUPP;
+
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_OPEN:
+		return -EBADFD;
+	default:
+		break;
+	}
+
 	stream->ops->pointer(stream, tstamp);
 	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
 		 tstamp->copied_total);

-- 
2.47.3

