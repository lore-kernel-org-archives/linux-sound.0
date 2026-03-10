Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CAF4418DA;
	Tue, 10 Mar 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136204; cv=none; b=pLz+FEQezYpKnpxzHTmFQocEXPMhEIxeAi5SLmoVmsOiyxRvJXXG8fNkjH6IQ7ijKyacBwXJALf5C8k7J8JUB1MumalmzEDe0VGIM6HI+KPtx5ers2zNP7GlxuVBQ0OrVf/M0MXsidzY9x0Ot6tkifaxOwlWzqEVnwewaU64KKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136204; c=relaxed/simple;
	bh=nUyfiyrBLWP9wnTWD935hL9Q58e7lE1ID8A/rGidr9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pb2lqHhSWMvEhxLAHCQYXRSgc6Lo27FB0C9bnQA9N4y0IgeitBoWB0bvJjpzYh+WeKKDMjyCddiCjVqKLOCWWcOPFqURSxIQyXHOulUZUC0gQfXs/eqo/SWH/mOBITs5ECEIZKnoeUflxVHHGP1EOwzxeSnCDPjBUd7aw4aPit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=Lvwc4mHc; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Lvwc4mHc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=SQJLMbzxhHZnbH19rrWBDrNrbuBamV1HNNawub++zzE=; b=Lvwc4mHcgFeEEu
	XTFi3I90qM/Y+0lmuFsteU4VadQw+OqZOHZszBcQhvQpV2+Hoix+dIfT/Z8BgKuLi5MmoXXfCOV6v
	1acnZU843LIU32VgS0x0XvpWxw7HEz9Ik9DBgovwPWAZfowhFw5/1TP/RGWO/KtvmCu41W3ik4nK+
	vq4fns3yWrV/hTEk5P2Hsq55xDTdYHCGRD5NzeIkZox2toC4qtgWlL0U/iIJH+wX8fRwL6g/byRLf
	Q/DvV+yjlG6RSenwx2Pe+f4selYR1PvpvvjpAnhQXxfekPoUfdnd0ZR8J74LkFMpRpCoyysIz8rl+
	8MwEqZwmSzrx92j+/KuA==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vztio-006cG5-0i; Tue, 10 Mar 2026 09:49:50 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vztin-00000000G8a-38FF;
	Tue, 10 Mar 2026 09:49:49 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	iwai@suse.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ASoC: soc-topology: fix __le32 conversion in printed values
Date: Tue, 10 Mar 2026 09:49:48 +0000
Message-Id: <20260310094948.62023-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

A number of dev_dbg() and dev_err() calls get passed values that are
of __le32 type which does not get noticed by sparse until my variadic
checking patches.

There are a number of these, and we should probably fix these up.

The sparse warnings are numerous so the first few are listed here that
this patch fixes:

sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 4 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] get
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 5 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] put
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 6 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] info
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 4 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] get
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 5 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] put
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 6 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] info
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 4 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] get
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 5 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] put
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 6 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] info

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/soc-topology.c | 47 +++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 064b8d76b955..2108ff417904 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -225,7 +225,10 @@ static inline void soc_control_err(struct soc_tplg *tplg,
 {
 	dev_err(tplg->dev,
 		"ASoC: no complete control IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
-		name, hdr->ops.get, hdr->ops.put, hdr->ops.info,
+		name,
+		le32_to_cpu(hdr->ops.get),
+		le32_to_cpu(hdr->ops.put),
+		le32_to_cpu(hdr->ops.info),
 		soc_tplg_get_offset(tplg));
 }
 
@@ -239,7 +242,7 @@ static int soc_tplg_vendor_load(struct soc_tplg *tplg,
 		ret = tplg->ops->vendor_load(tplg->comp, tplg->index, hdr);
 	else {
 		dev_err(tplg->dev, "ASoC: no vendor load callback for ID %d\n",
-			hdr->vendor_type);
+			le32_to_cpu(hdr->vendor_type));
 		return -EINVAL;
 	}
 
@@ -248,7 +251,8 @@ static int soc_tplg_vendor_load(struct soc_tplg *tplg,
 			"ASoC: vendor load failed at hdr offset %ld/0x%lx for type %d:%d\n",
 			soc_tplg_get_hdr_offset(tplg),
 			soc_tplg_get_hdr_offset(tplg),
-			hdr->type, hdr->vendor_type);
+			le32_to_cpu(hdr->type),
+			le32_to_cpu(hdr->vendor_type));
 	return ret;
 }
 
@@ -626,7 +630,7 @@ static int soc_tplg_create_tlv(struct soc_tplg *tplg,
 		/* TODO: add support for other TLV types */
 		default:
 			dev_dbg(tplg->dev, "Unsupported TLV type %d\n",
-					tplg_tlv->type);
+				le32_to_cpu(tplg_tlv->type));
 			return -EINVAL;
 		}
 	}
@@ -653,7 +657,7 @@ static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcon
 	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) + le32_to_cpu(mc->priv.size);
 
 	dev_dbg(tplg->dev, "ASoC: adding mixer kcontrol %s with access 0x%x\n",
-		mc->hdr.name, mc->hdr.access);
+		mc->hdr.name, le32_to_cpu(mc->hdr.access));
 
 	kc->name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
 	if (!kc->name)
@@ -776,7 +780,7 @@ static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcont
 
 	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) + le32_to_cpu(ec->priv.size));
 
-	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n", ec->hdr.name, ec->items);
+	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n", ec->hdr.name, le32_to_cpu(ec->items));
 
 	kc->name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
 	if (!kc->name)
@@ -812,7 +816,7 @@ static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcont
 		break;
 	default:
 		dev_err(tplg->dev, "ASoC: invalid enum control type %d for %s\n",
-			ec->hdr.ops.info, ec->hdr.name);
+			le32_to_cpu(ec->hdr.ops.info), ec->hdr.name);
 		return -EINVAL;
 	}
 
@@ -846,7 +850,7 @@ static int soc_tplg_control_dbytes_create(struct soc_tplg *tplg, struct snd_kcon
 	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) + le32_to_cpu(be->priv.size));
 
 	dev_dbg(tplg->dev, "ASoC: adding bytes kcontrol %s with access 0x%x\n",
-		be->hdr.name, be->hdr.access);
+		be->hdr.name, le32_to_cpu(be->hdr.access));
 
 	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
 	if (!kc->name)
@@ -976,7 +980,7 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 	int ret;
 	int i;
 
-	dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", hdr->count,
+	dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", le32_to_cpu(hdr->count),
 		soc_tplg_get_offset(tplg));
 
 	for (i = 0; i < le32_to_cpu(hdr->count); i++) {
@@ -1004,7 +1008,7 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 
 		if (ret < 0) {
 			dev_err(tplg->dev, "ASoC: invalid control type: %d, index: %d at 0x%lx\n",
-				control_hdr->type, i, soc_tplg_get_offset(tplg));
+				le32_to_cpu(control_hdr->type), i, soc_tplg_get_offset(tplg));
 			return ret;
 		}
 	}
@@ -1041,7 +1045,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 		return -EINVAL;
 
 	dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index %d\n", count,
-		hdr->index);
+		le32_to_cpu(hdr->index));
 
 	for (i = 0; i < count; i++) {
 		route = devm_kzalloc(tplg->dev, sizeof(*route), GFP_KERNEL);
@@ -1117,7 +1121,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 		return -EINVAL;
 
 	dev_dbg(tplg->dev, "ASoC: creating DAPM widget %s id %d\n",
-		w->name, w->id);
+		w->name, le32_to_cpu(w->id));
 
 	memset(&template, 0, sizeof(template));
 
@@ -1201,7 +1205,8 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 			break;
 		default:
 			dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
-				control_hdr->ops.get, control_hdr->ops.put,
+				le32_to_cpu(control_hdr->ops.get),
+				le32_to_cpu(control_hdr->ops.put),
 				le32_to_cpu(control_hdr->ops.info));
 			ret = -EINVAL;
 			goto hdr_err;
@@ -1746,7 +1751,7 @@ static int soc_tplg_link_config(struct soc_tplg *tplg,
 				     name, stream_name);
 	if (!link) {
 		dev_err(tplg->dev, "ASoC: physical link %s (id %d) not exist\n",
-			name, cfg->id);
+			name, le32_to_cpu(cfg->id));
 		return -EINVAL;
 	}
 
@@ -1959,7 +1964,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 		dev_err(tplg->dev,
 			"ASoC: invalid header of type %d at offset %ld payload_size %d\n",
 			le32_to_cpu(hdr->type), soc_tplg_get_hdr_offset(tplg),
-			hdr->payload_size);
+			le32_to_cpu(hdr->payload_size));
 		return -EINVAL;
 	}
 
@@ -1967,7 +1972,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	if (le32_to_cpu(hdr->magic) == SOC_TPLG_MAGIC_BIG_ENDIAN) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d big endian not supported header got %x at offset 0x%lx size 0x%zx.\n",
-			tplg->pass, hdr->magic,
+			tplg->pass, le32_to_cpu(hdr->magic),
 			soc_tplg_get_hdr_offset(tplg), tplg->fw->size);
 		return -EINVAL;
 	}
@@ -1975,7 +1980,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	if (le32_to_cpu(hdr->magic) != SND_SOC_TPLG_MAGIC) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d does not have a valid header got %x at offset 0x%lx size 0x%zx.\n",
-			tplg->pass, hdr->magic,
+			tplg->pass, le32_to_cpu(hdr->magic),
 			soc_tplg_get_hdr_offset(tplg), tplg->fw->size);
 		return -EINVAL;
 	}
@@ -1985,7 +1990,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	    le32_to_cpu(hdr->abi) < SND_SOC_TPLG_ABI_VERSION_MIN) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d invalid ABI version got 0x%x need 0x%x at offset 0x%lx size 0x%zx.\n",
-			tplg->pass, hdr->abi,
+			tplg->pass, le32_to_cpu(hdr->abi),
 			SND_SOC_TPLG_ABI_VERSION, soc_tplg_get_hdr_offset(tplg),
 			tplg->fw->size);
 		return -EINVAL;
@@ -2055,8 +2060,10 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
 	if (tplg->pass == hdr_pass) {
 		dev_dbg(tplg->dev,
 			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
-			hdr->payload_size, hdr->type, hdr->version,
-			hdr->vendor_type, tplg->pass);
+			le32_to_cpu(hdr->payload_size),
+			le32_to_cpu(hdr->type),
+			le32_to_cpu(hdr->version),
+			le32_to_cpu(hdr->vendor_type), tplg->pass);
 		return elem_load(tplg, hdr);
 	}
 
-- 
2.37.2.352.g3c44437643

